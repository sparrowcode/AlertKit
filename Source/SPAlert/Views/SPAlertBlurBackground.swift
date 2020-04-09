//
//  SPAlertBlurBackground.swift
//  SPAlert iOS
//
//  Created by Pedro Cavaleiro on 09/04/2020.
//  Copyright © 2020 Ivan Vorobei. All rights reserved.
//

import Foundation
import UIKit

// This class is the container for the blur view
class SPAlertBlurBackground: UIView {
    
    init(keyWindow: UIView, withRadius blurRadius: CGFloat = 5) {
        super.init(frame: keyWindow.bounds)
        self.backgroundColor = .clear
        self.frame = keyWindow.bounds
        
        let blurView = BlurView(withRadius: blurRadius)
        blurView.frame = keyWindow.bounds
        
        addSubview(blurView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // This class was created by Collin Hundley on 1/15/16
    // The native method using the UIBlurEffect does not allow to set the blur radius
    fileprivate class BlurView: UIVisualEffectView {
        
        private let blurEffect: UIBlurEffect
        public var blurRadius: CGFloat {
            return blurEffect.value(forKeyPath: "blurRadius") as! CGFloat
        }
        
        public convenience init() {
            self.init(withRadius: 0)
        }
        
        public init(withRadius radius: CGFloat) {
            let blurClass: AnyObject.Type = NSClassFromString("_UICustomBlurEffect")!
            let blurObject: NSObject.Type = blurClass as! NSObject.Type
            self.blurEffect = blurObject.init() as! UIBlurEffect
            self.blurEffect.setValue(1.0, forKeyPath: "scale")
            self.blurEffect.setValue(radius, forKeyPath: "blurRadius")
            super.init(effect: radius == 0 ? nil : self.blurEffect)
        }
        
        required public init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        public func setBlurRadius(radius: CGFloat) {
            guard radius != blurRadius else {
                return
            }
            blurEffect.setValue(radius, forKeyPath: "blurRadius")
            self.effect = blurEffect
        }
        
    }
    
}
