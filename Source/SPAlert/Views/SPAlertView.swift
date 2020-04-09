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
    private var titleLabel: UILabel?

    /**
     Small text on alert.
     */
    private var subtitleLabel: UILabel?

    /**
     Icon view. Size for it configure in `layout` property.
     */
    private var iconView: UIView?

    /**
     Activity view used when instantiating using `init(loadingMessage:)`
     */
    private var activityView: UIActivityIndicatorView?

    /**
     Blur view for background.
     */
    private var backgroundView: UIVisualEffectView!

    /**
     Automatic dismissal trigger duration.
     Set to nil to disable the automatic dismissal.
     The default value is __1.5 seconds__.
     */
    public var duration: TimeInterval? = 1.5
    
    /**
     Allow dismiss by tap on alert. By default it allowed.
     */
    public var dismissByTap = true
    
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

    /**
     Set the alert width (the default value is __250 points__).
     Make sure you set this before presenting the alert!
     */
    public var width: CGFloat = 250

    /**
     Set to `true` if you want to disable the user interaction of the key window when `present()` is called
     and whenever `dismiss()` get called, we enable back the user interaction.
     */
    public var disableUserInteractionWhenPresenting = false
    
    /**
     Set to `true` if you want to make the loading view rectangualar
     */
    public var makeLoadingViewRectangular = true
    
    /**
     Color used to set labels's text color and the activityView's tint color if any.
     It also updates all the colors used by the labes and the activity view that were defined in the initialization
     process.
    */
    public var foregroundColor: UIColor? = nil {
        willSet {
            /// Updates the UI with the new values for that all the views must be removed and added
            self.iconView?.removeFromSuperview()
            self.titleLabel?.removeFromSuperview()
            self.subtitleLabel?.removeFromSuperview()
            self.activityView?.removeFromSuperview()
            
            if let _ = activityView { activityView!.color = newValue }
            titleLabel?.textColor = newValue
            
            
            if let iconView = iconView {
                iconView.tintColor = newValue
                self.iconView = iconView
                addSubview(iconView)
            }
            if let titleLabel = titleLabel {
                titleLabel.textColor = newValue
                self.titleLabel = titleLabel
                addSubview(titleLabel)
            }
            if let subtitleLabel = subtitleLabel {
                subtitleLabel.textColor = newValue
                self.subtitleLabel = subtitleLabel
                addSubview(subtitleLabel)
            }
            if let activityView = activityView {
                activityView.color = newValue
                self.activityView = activityView
                addSubview(activityView)
            }
        }
    }
    
    /// Creates a default foregroundColor
    private var foregroundColorDefault: UIColor {
        if isDarkMode {
            return UIColor(red: 127/255, green: 127/255, blue: 129/255, alpha: 1)
        } else {
            return UIColor(red: 88/255, green: 87/255, blue: 88/255, alpha: 1)
        }
    }

    /// Enables the blur of the background, it creates the blur UI when set to true and destroys when set to false
    public var blurBackground: Bool = false {
        willSet {
            if newValue {
                self.backgroundBlurUI = SPAlertBlurBackground.init(keyWindow: self.keyWindow, withRadius: self.backgroundBlurRadius)
            } else {
                if backgroundBlurUI != nil { backgroundBlurUI?.removeFromSuperview() }
                self.backgroundBlurUI = nil
            }
        }
    }
    
    /// Amount of blur in the background
    public var backgroundBlurRadius: CGFloat = 5
    
    /// Contains the UI with the blur
    private var backgroundBlurUI: UIView?
    
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

    /**
     Display an alert with an activity indicator and a subtitle underneath.
     */
    public convenience init(loadingMessage: String, blurBackground: Bool = true, timeout: Double? = nil) {
        self.init(message: loadingMessage)
        
        duration = timeout
        self.blurBackground = blurBackground // During loading the best practice is to blur the background, none the less, this can be disabled
        // During the init phase the `willSet` is not available so we must initialize manually
        if blurBackground {
            self.backgroundBlurUI = SPAlertBlurBackground.init(keyWindow: self.keyWindow, withRadius: self.backgroundBlurRadius)
        }
        
        // we override the subtitle label's font weight
        subtitleLabel!.font = .boldSystemFont(ofSize: subtitleLabel!.font.pointSize)

        activityView = {
            if #available(iOS 13.0, *) {
                return UIActivityIndicatorView(style: .large)
            } else {
                return UIActivityIndicatorView(style: .whiteLarge)
            }
        }()

        if #available(iOS 13.0, *) {
            // Let the system use the default color
        } else {
            activityView!.color = foregroundColor
        }

        addSubview(activityView!)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.foregroundColor = self.foregroundColorDefault /// Gives the default colors to the foreground color
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
            self.titleLabel = titleLabel /// Updates the stored property with the new properties
            addSubview(titleLabel)
        }
        
        if let subtitleLabel = subtitleLabel {
            subtitleLabel.font = UIFont.systemFont(ofSize: 16)
            subtitleLabel.numberOfLines = 0
            let style = NSMutableParagraphStyle()
            style.lineSpacing = 2
            style.alignment = .center
            subtitleLabel.attributedText = NSAttributedString(string: subtitleLabel.text ?? "", attributes: [.paragraphStyle: style])
            self.subtitleLabel = subtitleLabel /// Updates the stored property with the new properties
            addSubview(subtitleLabel)
        }
        
        iconView?.tintColor = foregroundColor
        titleLabel?.textColor = foregroundColor
        subtitleLabel?.textColor = foregroundColor
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
        activityView?.startAnimating()

        if disableUserInteractionWhenPresenting {
            keyWindow.isUserInteractionEnabled = false
        }

        UIView.animate(withDuration: 0.2, animations: {
            self.alpha = 1
            self.transform = CGAffineTransform.identity
        }, completion: { finished in
            if let iconView = self.iconView as? SPAlertIconAnimatable {
                iconView.animate()
            }

            if let duration = self.duration {
                DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                    self.dismiss()
                }
            }
        })
    }
    
    /**
     Use this method for force dismiss controller. By default it call automatically.
     */
    @objc public func dismiss() {
        if disableUserInteractionWhenPresenting {
            keyWindow.isUserInteractionEnabled = true
        }

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
        let sideSpace: CGFloat = 16
        let topMargin: CGFloat = 8

        if let activityView = activityView {
            let activityViewBottomSpace: CGFloat = 8
            let yPosition: CGFloat
            if makeLoadingViewRectangular {
                yPosition = (self.width / 2)
                            + activityViewBottomSpace
                            + topMargin
            } else {
                yPosition = 23
                            + activityView.bounds.height
                            + activityViewBottomSpace
            }
            
            layout(subtitleLabel!, x: sideSpace, y: yPosition, width: width - 2 * sideSpace)
            
            if makeLoadingViewRectangular {
                activityView.frame.origin.y = (self.width / 2) - activityViewBottomSpace - activityView.bounds.height + topMargin
            } else {
                activityView.frame.origin.y = 23
            }
            activityView.center.x = subtitleLabel!.center.x
        } else {
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
        if activityView != nil {
            if self.makeLoadingViewRectangular {
                return self.width
            } else {
                return subtitleLabel!.frame.origin.y
                        + subtitleLabel!.bounds.height
                        + layout.bottomSpace
            }
        } else if let subtitleLabel = subtitleLabel {
            if titleLabel == nil {
                return subtitleLabel.frame.origin.y * 2
                    + subtitleLabel.frame.height
            } else {
                return subtitleLabel.frame.origin.y
                    + subtitleLabel.frame.height
                    + layout.bottomSpace
            }
        } else if let titleLabel = titleLabel {
            return titleLabel.frame.origin.y
                + titleLabel.frame.height
                + layout.bottomSpace
        }

        preconditionFailure()
    }
    
    /**
     Check `userInterfaceStyle` mode.
     */
    private var isDarkMode: Bool {
        if #available(iOS 12.0, *) {
            guard let window = UIApplication.shared.windows.first else {
                return false
            }

            if case .dark = window.traitCollection.userInterfaceStyle {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
}
