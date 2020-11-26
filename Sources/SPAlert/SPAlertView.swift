// The MIT License (MIT)
// Copyright © 2020 Ivan Vorobei (varabeis@icloud.com)
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
    
    // MARK: - Views
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private var iconView: UIView?
    
    private lazy var backgroundView: UIVisualEffectView = {
        let view: UIVisualEffectView = {
            if #available(iOS 13.0, *) {
                return UIVisualEffectView(effect: UIBlurEffect(style: .systemThickMaterial))
            } else {
                return UIVisualEffectView(effect: UIBlurEffect(style: .light))
            }
        }()
        view.isUserInteractionEnabled = false
        return view
    }()
    
    // MARK: - Properties
    
    open var dismissByTap: Bool = true
    
    // MARK: - Initializers
    
    public init(title: String, message: String?, preset: SPAlertPreset) {
        super.init(frame: CGRect.zero)
        commonInit()
    }
    
    public init(title: String, message: String?, icon view: UIView) {
        super.init(frame: CGRect.zero)
        commonInit()
    }
    
    public init(title: String, message: String?, image: UIImage) {
        super.init(frame: CGRect.zero)
        commonInit()
    }
    
    public init(message: String) {
        super.init(frame: CGRect.zero)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        layer.masksToBounds = true
        layer.cornerRadius = 8
        backgroundColor = .clear
    }
    
    // MARK: - Present
    
    open func present(duration: TimeInterval = 1.5, haptic: SPAlertHaptic = .success, completion: (() -> Void)? = nil) {
        
    }
}
