// The MIT License (MIT)
// Copyright © 2019 Ivan Varabei (varabeis@icloud.com)
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

/**
View which presenting. You can configure `titleLabel`, `subtitleLabel` and other. For change duration use property `duration`.
Also you can configure layout & haptic. If you use preset, all configure automatically.
*/
open class SPAlertView: UIView {
    
    /**
     Large top text on alert.
     */
    private var titleLabel: UILabel? = nil
    
    /**
     Small text on alert.
     */
    private var subtitleLabel: UILabel? = nil
    
    /**
     Icon view. Size for it configure in `layout` property.
     */
    private var iconView: UIView? = nil
    
    /**
     Blur view for background.
     */
    private var backgroundView: UIVisualEffectView!
    
    /**
     Duration time when alert visible.
     */
    public var duration: TimeInterval = 1.5
    
    /**
     Allow dismiss by tap on alert. By default it allowed.
     */
    public var dismissByTap: Bool = true
    
    /**
     Vibro for this alert. Default value using for presets. If you init custom. haptic not configure.
     */
    public var haptic: SPAlertHaptic = .none
    
    /**
     Spacing and icon size configure here. Auto configure when you using presets.
     */
    public var layout = SPAlertLayout()
    
    /**
     View on which present alert.
     */
    public var keyWindow: UIView = (UIApplication.shared.keyWindow ?? UIWindow())
    
    // MARK: Init
    
    public init(title: String, message: String?, preset: SPAlertPreset) {
        super.init(frame: CGRect.zero)
        iconView = preset.iconView
        layout = preset.layout
        haptic = preset.haptic
        titleLabel = UILabel()
        titleLabel?.text = title
        if let message = message {
            subtitleLabel = UILabel()
            subtitleLabel?.text = message
        }
        commonInit()
    }
    
    public init(title: String, message: String?, icon view: UIView) {
        super.init(frame: CGRect.zero)
        iconView = view
        titleLabel = UILabel()
        titleLabel?.text = title
        if let message = message {
            subtitleLabel = UILabel()
            subtitleLabel?.text = message
        }
        commonInit()
    }
    
    public init(title: String, message: String?, image: UIImage) {
        super.init(frame: CGRect.zero)
        iconView = UIImageView(image: image.withRenderingMode(.alwaysTemplate))
        iconView?.contentMode = .scaleAspectFit
        titleLabel = UILabel()
        titleLabel?.text = title
        if let message = message {
            subtitleLabel = UILabel()
            subtitleLabel?.text = message
        }
        commonInit()
    }
    
    public init(message: String) {
        super.init(frame: CGRect.zero)
        subtitleLabel = UILabel()
        subtitleLabel?.text = message
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .clear
        layer.masksToBounds = true
        layer.cornerRadius = 8
        
        backgroundView = {
            if #available(iOS 12.0, *) {
                return UIVisualEffectView(effect: UIBlurEffect(style: isDarkMode ? .dark : .extraLight))
            } else {
                return UIVisualEffectView(effect: UIBlurEffect(style: .extraLight))
            }
        }()
        backgroundView.isUserInteractionEnabled = false
        addSubview(backgroundView)
        
        if dismissByTap {
            let tapGesterRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismiss))
            addGestureRecognizer(tapGesterRecognizer)
        }
        
        if let iconView = iconView {
            addSubview(iconView)
        }
        
        if let titleLabel = titleLabel {
            titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
            titleLabel.numberOfLines = 0
            let style = NSMutableParagraphStyle()
            style.lineSpacing = 3
            style.alignment = .center
            titleLabel.attributedText = NSAttributedString(string: titleLabel.text ?? "", attributes: [.paragraphStyle: style])
            addSubview(titleLabel)
        }
        
        if let subtitleLabel = subtitleLabel {
            subtitleLabel.font = UIFont.systemFont(ofSize: 16)
            subtitleLabel.numberOfLines = 0
            let style = NSMutableParagraphStyle()
            style.lineSpacing = 2
            style.alignment = .center
            subtitleLabel.attributedText = NSAttributedString(string: subtitleLabel.text ?? "", attributes: [.paragraphStyle: style])
            addSubview(subtitleLabel)
        }
        
        let darkModeColor = UIColor(red: 127 / 255, green: 127 / 255, blue: 129 / 255, alpha: 1)
        let lightModeColor = UIColor(red: 88 / 255, green: 87 / 255, blue: 88 / 255, alpha: 1)
        let color = isDarkMode ? darkModeColor : lightModeColor
        iconView?.tintColor = color
        titleLabel?.textColor = color
        subtitleLabel?.textColor = color
    }
    
    // MARK: Public
    
    /**
     Use this method for present controller. No need pass any controller, alert appear on `keyWindow`.
     */
    public func present() {
        haptic.impact()
        keyWindow.addSubview(self)
        layoutIfNeeded()
        layoutSubviews()
        alpha = 0
        transform = transform.scaledBy(x: 0.8, y: 0.8)
        
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
    
    /**
     Use this method for force dismiss controller. By default it call automatically.
     */
    @objc public func dismiss() {
        UIView.animate(withDuration: 0.2, animations: {
            self.alpha = 0
            self.transform = self.transform.scaledBy(x: 0.8, y: 0.8)
        }, completion: { finished in
            self.removeFromSuperview()
        })
    }
    
    // MARK: Layout
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        let width: CGFloat = 250
        let sideSpace: CGFloat = 16
        if let iconView = iconView {
            iconView.frame = CGRect.init(x: 0, y: layout.topSpace, width: layout.iconWidth, height: layout.iconHeight)
            iconView.center.x = width / 2
        }
        if let titleLabel = titleLabel {
            let yPosition = (iconView == nil) ? 32 : (iconView!.frame.origin.y + iconView!.frame.height + layout.bottomIconSpace)
            layout(titleLabel, x: sideSpace, y: yPosition, width: width - sideSpace * 2)
        }
        if let subtitleLabel = subtitleLabel {
            let yPosition = (titleLabel == nil) ? 23 : titleLabel!.frame.origin.y + titleLabel!.frame.height + 4
            layout(subtitleLabel, x: sideSpace, y: yPosition, width: width - sideSpace * 2)
        }
        frame = CGRect.init(x: 0, y: 0, width: width, height: calculateHeight())
        center = CGPoint.init(x: keyWindow.frame.midX, y: keyWindow.frame.midY)
        backgroundView.frame = bounds
    }
    
    /**
     Layout labels with multi-lines.
     */
    private func layout(_ label: UILabel, x: CGFloat, y: CGFloat, width: CGFloat) {
        label.frame = CGRect.init(x: x, y: y, width: width, height: 0)
        label.sizeToFit()
        label.frame = CGRect.init(x: x, y: y, width: width, height: label.frame.height)
    }
    
    /**
     This menthod call when need calulate height with layout.
     */
    private func calculateHeight() -> CGFloat {
        var height: CGFloat = 0
        if let subtitleLabel = subtitleLabel {
            if titleLabel == nil {
                height += subtitleLabel.frame.origin.y * 2 + subtitleLabel.frame.height
            } else {
                height += subtitleLabel.frame.origin.y + subtitleLabel.frame.height + layout.bottomSpace
            }
        } else {
            if let titleLabel = titleLabel {
                height += titleLabel.frame.origin.y + titleLabel.frame.height + layout.bottomSpace
            }
        }
        return height
    }
    
    /**
     Check `userInterfaceStyle` mode.
     */
    private var isDarkMode: Bool {
        if #available(iOS 12.0, *) {
            switch UIApplication.shared.windows.first?.traitCollection.userInterfaceStyle ?? .light {
            case .dark:
                return true
            case .light:
                return false
            case .unspecified:
                return false
            @unknown default:
                return false
            }
        } else {
            return false
        }
    }
}
