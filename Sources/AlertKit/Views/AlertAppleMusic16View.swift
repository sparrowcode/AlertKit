import UIKit

public class AlertAppleMusic16View: UIView {
    
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
    
    var completion: (() -> Void)? = nil
    
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
            label.font = UIFont.preferredFont(forTextStyle: .title2, weight: .bold)
            label.numberOfLines = 0
            let style = NSMutableParagraphStyle()
            style.lineSpacing = 3
            style.alignment = .center
            label.attributedText = NSAttributedString(string: title, attributes: [.paragraphStyle: style])
            titleLabel = label
        } else {
            self.titleLabel = nil
        }
        
        if let subtitle = subtitle {
            let label = UILabel()
            label.font = UIFont.preferredFont(forTextStyle: .body)
            label.numberOfLines = 0
            let style = NSMutableParagraphStyle()
            style.lineSpacing = 2
            style.alignment = .center
            label.attributedText = NSAttributedString(string: subtitle, attributes: [.paragraphStyle: style])
            subtitleLabel = label
        } else {
            self.subtitleLabel = nil
        }
        
        if let icon = icon {
            let view = icon.createView(lineThick: 9)
            self.iconView = view
        } else {
            self.iconView = nil
        }
        
        if icon == nil {
            layout = AlertLayout.message()
        } else {
            layout = AlertLayout(for: icon ?? .heart)
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
        
        layoutMargins = layout.margins
        
        layer.masksToBounds = true
        layer.cornerRadius = 8
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
        center = .init(x: viewForPresent.frame.midX, y: viewForPresent.frame.midY)
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
    
    private let layout: AlertLayout
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        backgroundView.frame = self.bounds
        
        if let iconView = self.iconView {
            iconView.frame = .init(origin: .init(x: 0, y: layoutMargins.top), size: layout.iconSize)
            iconView.center.x = bounds.midX
        }
        if let titleLabel = self.titleLabel {
            titleLabel.layoutDynamicHeight(
                x: layoutMargins.left,
                y: iconView == nil ? layoutMargins.top : (iconView?.frame.maxY ?? 0) + layout.spaceBetweenIconAndTitle,
                width: frame.width - layoutMargins.left - layoutMargins.right)
        }
        if let subtitleLabel = self.subtitleLabel {
            let yPosition: CGFloat = {
                if let titleLabel = self.titleLabel {
                    return titleLabel.frame.maxY + 4
                } else {
                    return layoutMargins.top
                }
            }()
            subtitleLabel.layoutDynamicHeight(x: layoutMargins.left, y: yPosition, width: frame.width - layoutMargins.left - layoutMargins.right)
        }
    }
    
    public override func sizeThatFits(_ size: CGSize) -> CGSize {
        let width: CGFloat = 250
        self.frame = .init(x: frame.origin.x, y: frame.origin.y, width: width, height: frame.height)
        layoutSubviews()
        let height = subtitleLabel?.frame.maxY ?? titleLabel?.frame.maxY ?? iconView?.frame.maxY ?? .zero
        return .init(width: width, height: height + layoutMargins.bottom)
    }
    
    private class AlertLayout {
        
        var iconSize: CGSize
        var margins: UIEdgeInsets
        var spaceBetweenIconAndTitle: CGFloat
        
        public init(iconSize: CGSize, margins: UIEdgeInsets, spaceBetweenIconAndTitle: CGFloat) {
            self.iconSize = iconSize
            self.margins = margins
            self.spaceBetweenIconAndTitle = spaceBetweenIconAndTitle
        }
        
        convenience init() {
            self.init(iconSize: .init(width: 100, height: 100), margins: .init(top: 43, left: 16, bottom: 25, right: 16), spaceBetweenIconAndTitle: 41)
        }
        
        static func message() -> AlertLayout {
            let layout = AlertLayout()
            layout.margins = UIEdgeInsets(top: 23, left: 16, bottom: 23, right: 16)
            return layout
        }
        
        convenience init(for preset: AlertIcon) {
            switch preset {
            case .done:
                self.init(
                    iconSize: .init(
                        width: 112,
                        height: 112
                    ),
                    margins: .init(
                        top: 63,
                        left: Self.defaultHorizontalInset,
                        bottom: 29,
                        right: Self.defaultHorizontalInset
                    ),
                    spaceBetweenIconAndTitle: 35
                )
            case .heart:
                self.init(
                    iconSize: .init(
                        width: 112,
                        height: 77
                    ),
                    margins: .init(
                        top: 49,
                        left: Self.defaultHorizontalInset,
                        bottom: 25,
                        right: Self.defaultHorizontalInset
                    ),
                    spaceBetweenIconAndTitle: 35
                )
            case .error:
                self.init(
                    iconSize: .init(
                        width: 86,
                        height: 86
                    ),
                    margins: .init(
                        top: 63,
                        left: Self.defaultHorizontalInset,
                        bottom: 29,
                        right: Self.defaultHorizontalInset
                    ),
                    spaceBetweenIconAndTitle: 39
                )
            case .spinnerLarge, .spinnerSmall:
                self.init(
                    iconSize: .init(
                        width: 16,
                        height: 16
                    ),
                    margins: .init(
                        top: 58,
                        left: Self.defaultHorizontalInset,
                        bottom: 27,
                        right: Self.defaultHorizontalInset
                    ),
                    spaceBetweenIconAndTitle: 39
                )
            case .custom(_):
                self.init(
                    iconSize: .init(
                        width: 100,
                        height: 100
                    ),
                    margins: .init(
                        top: 43,
                        left: Self.defaultHorizontalInset,
                        bottom: 25,
                        right: Self.defaultHorizontalInset
                    ),
                    spaceBetweenIconAndTitle: 35
                )
            }
        }
        
        private static var defaultHorizontalInset: CGFloat { return 16 }
    }
}
