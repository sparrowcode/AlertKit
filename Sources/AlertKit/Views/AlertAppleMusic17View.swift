import UIKit

public class AlertAppleMusic17View: UIView {
    
    open var dismissByTap: Bool = true
    open var dismissInTime: Bool = true
    open var duration: TimeInterval = 1.5
    open var haptic: AlertHaptic? = nil
    
    fileprivate let titleLabel: UILabel?
    fileprivate let subtitleLabel: UILabel?
    fileprivate let iconView: UIView?
    
    fileprivate weak var viewForPresent: UIView?
    fileprivate var presentDismissDuration: TimeInterval = 0.2
    fileprivate var presentDismissScale: CGFloat = 0.8
    
    open var completion: (() -> Void)? = nil
    
    private lazy var backgroundView: UIVisualEffectView = {
        let view: UIVisualEffectView = {
            #if !os(tvOS)
            if #available(iOS 13.0, *) {
                return UIVisualEffectView(effect: UIBlurEffect(style: .systemThickMaterial))
            } else {
                return UIVisualEffectView(effect: UIBlurEffect(style: .light))
            }
            #else
            return UIVisualEffectView(effect: UIBlurEffect(style: .light))
            #endif
        }()
        view.isUserInteractionEnabled = false
        return view
    }()
    
    public init(title: String?, subtitle: String?, icon: AlertIcon?) {
        
        if let title = title {
            let label = UILabel()
            label.font = UIFont.preferredFont(forTextStyle: .body, weight: .semibold, addPoints: -2)
            label.numberOfLines = 0
            let style = NSMutableParagraphStyle()
            style.lineSpacing = 3
            style.alignment = .left
            label.attributedText = NSAttributedString(string: title, attributes: [.paragraphStyle: style])
            titleLabel = label
        } else {
            self.titleLabel = nil
        }
        
        if let subtitle = subtitle {
            let label = UILabel()
            label.font = UIFont.preferredFont(forTextStyle: .footnote)
            label.numberOfLines = 0
            let style = NSMutableParagraphStyle()
            style.lineSpacing = 2
            style.alignment = .left
            label.attributedText = NSAttributedString(string: subtitle, attributes: [.paragraphStyle: style])
            subtitleLabel = label
        } else {
            self.subtitleLabel = nil
        }
        
        if let icon = icon {
            let view = icon.createView(lineThick: 3)
            self.iconView = view
        } else {
            self.iconView = nil
        }
        
        super.init(frame: .zero)
        
        preservesSuperviewLayoutMargins = false
        insetsLayoutMarginsFromSafeArea = false
        
        backgroundColor = .clear
        addSubview(backgroundView)
        
        if let titleLabel = self.titleLabel {
            addSubview(titleLabel)
        }
        if let subtitleLabel = self.subtitleLabel {
            addSubview(subtitleLabel)
        }
        if let iconView = self.iconView {
            addSubview(iconView)
        }
        
        if subtitleLabel == nil {
            layoutMargins = .init(top: 17, left: 15, bottom: 17, right: 15 + ((icon == nil) ? .zero : 3))
        } else {
            layoutMargins = .init(top: 15, left: 15, bottom: 15, right: 15 + ((icon == nil) ? .zero : 3))
        }
        
        layer.masksToBounds = true
        layer.cornerRadius = 14
        layer.cornerCurve = .continuous
        
        switch icon {
        case .spinnerSmall, .spinnerLarge:
            dismissInTime = false
            dismissByTap = false
        default:
            dismissInTime = true
            dismissByTap = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func present(on view: UIView, completion: @escaping ()->Void = {}) {
        
        let contentColor = {
            let darkColor = UIColor(red: 127 / 255, green: 127 / 255, blue: 129 / 255, alpha: 1)
            let lightColor = UIColor(red: 88 / 255, green: 87 / 255, blue: 88 / 255, alpha: 1)
            if #available(iOS 12.0, *) {
                let interfaceStyle = view.traitCollection.userInterfaceStyle
                switch interfaceStyle {
                case .light: return lightColor
                case .dark: return darkColor
                case .unspecified: return lightColor
                @unknown default: return lightColor
                }
            } else {
                return lightColor
            }
        }()
        
        self.titleLabel?.textColor = contentColor
        self.subtitleLabel?.textColor = contentColor
        self.iconView?.tintColor = contentColor
        
        self.completion = completion
        self.viewForPresent = view
        viewForPresent?.addSubview(self)
        guard let viewForPresent = viewForPresent else { return }
        
        alpha = 0
        sizeToFit()
        center.x = viewForPresent.frame.midX
        frame.origin.y = viewForPresent.frame.height - viewForPresent.safeAreaInsets.bottom - frame.height - 64
        transform = transform.scaledBy(x: self.presentDismissScale, y: self.presentDismissScale)
        
        if dismissByTap {
            let tapGesterRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismiss))
            addGestureRecognizer(tapGesterRecognizer)
        }
        
        // Present
        
        haptic?.impact()
        
        UIView.animate(withDuration: presentDismissDuration, animations: {
            self.alpha = 1
            self.transform = CGAffineTransform.identity
        }, completion: { [weak self] finished in
            guard let self = self else { return }
            
            if let iconView = self.iconView as? AlertIconAnimatable {
                iconView.animate()
            }
            
            if self.dismissInTime {
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + self.duration) {
                    self.dismiss()
                }
            }
        })
    }
    
    @objc open func dismiss() {
        UIView.animate(withDuration: presentDismissDuration, animations: {
            self.alpha = 0
            self.transform = self.transform.scaledBy(x: self.presentDismissScale, y: self.presentDismissScale)
        }, completion: { [weak self] finished in
            self?.removeFromSuperview()
            self?.completion?()
        })
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        backgroundView.frame = self.bounds
        layout(maxWidth: frame.width)
    }
    
    public override func sizeThatFits(_ size: CGSize) -> CGSize {
        layout(maxWidth: nil)
        
        let maxX = subviews.sorted(by: { $0.frame.maxX > $1.frame.maxX }).first?.frame.maxX ?? .zero
        let currentNeedWidth = maxX + layoutMargins.right
        
        let maxWidth = {
            if let viewForPresent = self.viewForPresent {
                return min(viewForPresent.frame.width * 0.8, 270)
            } else {
                return 270
            }
        }()
        
        let usingWidth = min(currentNeedWidth, maxWidth)
        layout(maxWidth: usingWidth)
        let height = subtitleLabel?.frame.maxY ?? titleLabel?.frame.maxY ?? .zero
        return .init(width: usingWidth, height: height + layoutMargins.bottom)
    }
    
    private func layout(maxWidth: CGFloat?) {
        
        let spaceBetweenLabelAndIcon: CGFloat = 12
        let spaceBetweenTitleAndSubtitle: CGFloat = 4
        
        if let iconView = self.iconView {
            iconView.frame = .init(x: layoutMargins.left, y: .zero, width: 20, height: 20)
            let xPosition = iconView.frame.maxX + spaceBetweenLabelAndIcon
            if let maxWidth = maxWidth {
                let labelWidth = maxWidth - xPosition - layoutMargins.right
                titleLabel?.frame = .init(
                    x: xPosition,
                    y: layoutMargins.top,
                    width: labelWidth,
                    height: titleLabel?.frame.height ?? .zero
                )
                titleLabel?.sizeToFit()
                subtitleLabel?.frame = .init(
                    x: xPosition,
                    y: (titleLabel?.frame.maxY ?? layoutMargins.top) + spaceBetweenTitleAndSubtitle,
                    width: labelWidth,
                    height: subtitleLabel?.frame.height ?? .zero
                )
                subtitleLabel?.sizeToFit()
            } else {
                titleLabel?.sizeToFit()
                titleLabel?.frame.origin.x = xPosition
                titleLabel?.frame.origin.y = layoutMargins.top
                subtitleLabel?.sizeToFit()
                subtitleLabel?.frame.origin.x = xPosition
                subtitleLabel?.frame.origin.y = (titleLabel?.frame.maxY ?? layoutMargins.top) + spaceBetweenTitleAndSubtitle
            }
        } else {
            if let maxWidth = maxWidth {
                let labelWidth = maxWidth - layoutMargins.left - layoutMargins.right
                titleLabel?.frame = .init(
                    x: layoutMargins.left,
                    y: layoutMargins.top,
                    width: labelWidth,
                    height: titleLabel?.frame.height ?? .zero
                )
                titleLabel?.sizeToFit()
                subtitleLabel?.frame = .init(
                    x: layoutMargins.left,
                    y: (titleLabel?.frame.maxY ?? layoutMargins.top) + spaceBetweenTitleAndSubtitle,
                    width: labelWidth,
                    height: subtitleLabel?.frame.height ?? .zero
                )
                subtitleLabel?.sizeToFit()
            } else {
                titleLabel?.sizeToFit()
                titleLabel?.frame.origin.x = layoutMargins.left
                titleLabel?.frame.origin.y = layoutMargins.top
                subtitleLabel?.sizeToFit()
                subtitleLabel?.frame.origin.x = layoutMargins.left
                subtitleLabel?.frame.origin.y = (titleLabel?.frame.maxY ?? layoutMargins.top) + spaceBetweenTitleAndSubtitle
            }
        }
        
        iconView?.center.y = frame.height / 2
    }
}
