// The MIT License (MIT)
// Copyright © 2019 Ivan Vorobei (hello@ivanvorobei.by)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit

open class SPAlertView: UIView {
    
    public var duration: TimeInterval = 1.5
    public var dismissByTap: Bool = true
    public var haptic: SPAlertHaptic = .none
    
    public var iconColor: UIColor! {
        didSet {
            iconView?.tintColor = self.iconColor
        }
    }
    public var textColor: UIColor! {
        didSet {
            titleLabel?.textColor = self.textColor
            messageLabel?.textColor = self.textColor
        }
    }
    
    public var layout = SPAlertLayout()
    
    private var titleLabel: UILabel? = nil
    private var messageLabel: UILabel? = nil
    private var iconView: UIView? = nil
    private var backgroundView: UIVisualEffectView!
    
    private var isDarkMode: Bool {
        if #available(iOS 12.0, *) {
            if self.traitCollection.userInterfaceStyle == .dark {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    private var keyWindow: UIWindow { return UIApplication.shared.keyWindow ?? UIWindow() }
    
    //MARK: - Initializers
    
    public init(message: String) {
        super.init(frame: CGRect.zero)
        self.messageLabel = UILabel()
        self.messageLabel?.text = message
        self.commonInit()
    }
    
    public init(title: String, message: String?, preset: SPAlertPreset) {
        super.init(frame: CGRect.zero)
        self.iconView = preset.iconView
        self.layout = preset.layout
        self.haptic = preset.haptic
        self.titleLabel = UILabel()
        self.titleLabel?.text = title
        if let message = message {
            self.messageLabel = UILabel()
            self.messageLabel?.text = message
        }
        self.commonInit()
    }
    
    public init(title: String, message: String?, icon view: UIView) {
        super.init(frame: CGRect.zero)
        self.iconView = view
        self.titleLabel = UILabel()
        self.titleLabel?.text = title
        if let message = message {
            self.messageLabel = UILabel()
            self.messageLabel?.text = message
        }
        self.commonInit()
    }
    
    public init(title: String, message: String?, image: UIImage) {
        super.init(frame: CGRect.zero)
        self.iconView = UIImageView(image: image.withRenderingMode(.alwaysTemplate))
        self.iconView?.contentMode = .scaleAspectFit
        self.titleLabel = UILabel()
        self.titleLabel?.text = title
        if let message = message {
            self.messageLabel = UILabel()
            self.messageLabel?.text = message
        }
        self.commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    //MARK: - Configure
    
    private func commonInit() {
        
        self.backgroundColor = .clear
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 8
        
        if #available(iOS 12.0, *) {
            if self.traitCollection.userInterfaceStyle == .dark {
                self.backgroundView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
            } else {
                self.backgroundView = UIVisualEffectView(effect: UIBlurEffect(style: .extraLight))
            }
        } else {
            self.backgroundView = UIVisualEffectView(effect: UIBlurEffect(style: .extraLight))
        }
        
        self.backgroundView.isUserInteractionEnabled = false
        self.addSubview(self.backgroundView)
        
        if self.dismissByTap {
            let tapGesterRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismiss))
            self.addGestureRecognizer(tapGesterRecognizer)
        }
        
        if let iconView = self.iconView {
            self.addSubview(iconView)
        }
        
        if let titleLabel = self.titleLabel {
            titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
            titleLabel.numberOfLines = 0
            let style = NSMutableParagraphStyle()
            style.lineSpacing = 3
            style.alignment = .center
            titleLabel.attributedText = NSAttributedString(string: titleLabel.text ?? "", attributes: [.paragraphStyle: style])
            self.addSubview(titleLabel)
        }
        
        if let messageLabel = self.messageLabel {
            messageLabel.font = UIFont.systemFont(ofSize: 16)
            messageLabel.numberOfLines = 0
            let style = NSMutableParagraphStyle()
            style.lineSpacing = 2
            style.alignment = .center
            messageLabel.attributedText = NSAttributedString(string: messageLabel.text ?? "", attributes: [.paragraphStyle: style])
            self.addSubview(messageLabel)
        }
        
        self.iconColor = self.isDarkMode ? #colorLiteral(red: 0.4991744435, green: 0.4991744435, blue: 0.5042166096, alpha: 1) : #colorLiteral(red: 0.3450980392, green: 0.3411764706, blue: 0.3450980392, alpha: 1)
        self.textColor = self.isDarkMode ? #colorLiteral(red: 0.4991744435, green: 0.4991744435, blue: 0.5042166096, alpha: 1) : #colorLiteral(red: 0.3450980392, green: 0.3411764706, blue: 0.3450980392, alpha: 1)
    }
    
    //MARK: - Public Methods
    
    public func present() {
        
        self.haptic.impact()
        
        self.keyWindow.addSubview(self)
        self.layoutIfNeeded()
        self.alpha = 0
        self.transform = transform.scaledBy(x: 0.8, y: 0.8)
        
        UIView.animate(withDuration: 0.2, animations: {
            self.alpha = 1
            self.transform = CGAffineTransform.identity
        }, completion: {finished in
            if let iconView = self.iconView as? SPAlertIconAnimatable {
                iconView.animate()
            }
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + self.duration) {
                self.dismiss()
            }
        })
    }
    
    @objc func dismiss() {
        UIView.animate(withDuration: 0.2, animations: {
            self.alpha = 0
            self.transform = self.transform.scaledBy(x: 0.8, y: 0.8)
        }, completion: { finished in
            self.removeFromSuperview()
        })
    }
    
    //MARK: - Layout
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        let width: CGFloat = 250
        let sideSpace: CGFloat = 16
        
        if let iconView = self.iconView {
            iconView.frame = CGRect.init(x: (width - self.layout.iconWidth) / 2, y: self.layout.topSpace, width: self.layout.iconWidth, height: self.layout.iconHeight)
            iconView.center.x = width / 2
        }
 
        if let titleLabel = self.titleLabel {
            var yPosition: CGFloat {
                return self.iconView == nil ? 32 : (self.iconView!.frame.origin.y + self.iconView!.frame.height + self.layout.bottomIconSpace)
            }
            titleLabel.frame = CGRect.init(x: 0, y: 0, width: width - sideSpace * 2, height: 0)
            titleLabel.sizeToFit()
            titleLabel.frame = CGRect.init(x: sideSpace, y: yPosition, width: width - sideSpace * 2, height: titleLabel.frame.height)
        }
        
        if let messageLabel = self.messageLabel {
            
            var yPosition: CGFloat {
                return self.titleLabel == nil ? 23 : self.titleLabel!.frame.origin.y + self.titleLabel!.frame.height + 4
            }
            
            messageLabel.frame = CGRect.init(x: 0, y: 0, width: width - sideSpace * 2, height: 0)
            messageLabel.sizeToFit()
            messageLabel.frame = CGRect.init(x: sideSpace, y: yPosition, width: width - sideSpace * 2, height: messageLabel.frame.height)
        }
        
        self.frame = CGRect.init(x: 0, y: 0, width: width, height: self.height)
        self.center = CGPoint.init(x: self.keyWindow.frame.midX, y: self.keyWindow.frame.midY)
        self.backgroundView.frame = self.bounds
    }
    
    private var height: CGFloat {
        
        var height: CGFloat = 0
        
        if let messageLabel = self.messageLabel {
            if self.titleLabel == nil {
                height += messageLabel.frame.origin.y * 2 + messageLabel.frame.height
            } else {
                height += messageLabel.frame.origin.y + messageLabel.frame.height + self.layout.bottomSpace
            }
        } else {
            if let titleLabel = self.titleLabel {
                height += titleLabel.frame.origin.y + titleLabel.frame.height + self.layout.bottomSpace
            }
        }
        
        return height
    }
}
