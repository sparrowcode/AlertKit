import UIKit
import SwiftUI

@available(iOS 13, visionOS 1, *)
public class AlertAppleMusic17View: UIView, AlertViewProtocol, AlertViewInternalDismissProtocol {
    
    open var dismissByTap: Bool = true
    open var dismissInTime: Bool = true
    open var duration: TimeInterval = 1.5
    open var haptic: AlertHaptic? = nil
    
    public let titleLabel: UILabel?
    public let subtitleLabel: UILabel?
    public let iconView: UIView?
    
    public static var defaultContentColor = UIColor { trait in
        #if os(visionOS)
        return .label
        #else
        switch trait.userInterfaceStyle {
        case .dark: return UIColor(red: 127 / 255, green: 127 / 255, blue: 129 / 255, alpha: 1)
        default: return UIColor(red: 88 / 255, green: 87 / 255, blue: 88 / 255, alpha: 1)
        }
        #endif
    }
    
    fileprivate weak var viewForPresent: UIView?
    fileprivate var presentDismissDuration: TimeInterval = 0.2
    fileprivate var presentDismissScale: CGFloat = 0.8
    
    fileprivate var completion: (()->Void)? = nil
    
    private lazy var backgroundView: UIView = {
        #if os(visionOS)
        let swiftUIView = VisionGlassBackgroundView(cornerRadius: 12)
        let host = UIHostingController(rootView: swiftUIView)
        let hostView = host.view ?? UIView()
        hostView.isUserInteractionEnabled = false
        return hostView
        #else
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterial))
        view.isUserInteractionEnabled = false
        return view
        #endif
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
        
        self.titleLabel?.textColor = Self.defaultContentColor
        self.subtitleLabel?.textColor = Self.defaultContentColor
        self.iconView?.tintColor = Self.defaultContentColor
        
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
    
    open func present(on view: UIView, completion: (()->Void)? = nil) {
        self.viewForPresent = view
        self.completion = completion
        viewForPresent?.addSubview(self)
        guard let viewForPresent = viewForPresent else { return }
        
        alpha = 0
        sizeToFit()
        center.x = viewForPresent.frame.midX
        #if os(visionOS)
        frame.origin.y = viewForPresent.safeAreaInsets.top + 24
        #elseif os(iOS)
        frame.origin.y = viewForPresent.frame.height - viewForPresent.safeAreaInsets.bottom - frame.height - 64
        #endif
        
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
                    // If dismiss manually no need call original completion.
                    if self.alpha != 0 {
                        self.dismiss()
                    }
                }
            }
        })
    }
    
    @objc open func dismiss() {
        self.dismiss(customCompletion: self.completion)
    }
    
    func dismiss(customCompletion: (()->Void)? = nil) {
        UIView.animate(withDuration: presentDismissDuration, animations: {
            self.alpha = 0
            self.transform = self.transform.scaledBy(x: self.presentDismissScale, y: self.presentDismissScale)
        }, completion: { [weak self] finished in
            self?.removeFromSuperview()
            customCompletion?()
        })
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        guard self.transform == .identity else { return }
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
    
    #if os(visionOS)
    struct VisionGlassBackgroundView: View {
        
        let cornerRadius: CGFloat
        
        var body: some View {
            ZStack {
                Color.clear
            }
            .glassBackgroundEffect(in: .rect(cornerRadius: cornerRadius))
            .opacity(0.4)
        }
    }
    #endif
}
