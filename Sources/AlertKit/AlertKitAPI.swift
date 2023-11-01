import UIKit

public enum AlertKitAPI {
    
    public static func present(view: AlertViewProtocol, completion: @escaping ()->Void = {}) {
        guard let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first else { return }
        view.present(on: window, completion: completion)
    }
    
    public static func present(title: String? = nil, subtitle: String? = nil, icon: AlertIcon? = nil, style: AlertViewStyle, haptic: AlertHaptic? = nil) {
        switch style {
        #if os(iOS)
        case .iOS16AppleMusic:
            guard let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first else { return }
            let view = AlertAppleMusic16View(title: title, subtitle: subtitle, icon: icon)
            view.haptic = haptic
            view.present(on: window)
        #endif
        #if os(iOS) || os(visionOS)
        case .iOS17AppleMusic:
            guard let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first else { return }
            let view = AlertAppleMusic17View(title: title, subtitle: subtitle, icon: icon)
            view.haptic = haptic
            view.present(on: window)
        #endif
        }
    }
    
    public static func dismissAllAlerts(completion: (() -> Void)? = nil) {
        
        var alertViews: [AlertViewProtocol] = []
        
        for window in UIApplication.shared.windows {
            for view in window.subviews {
                if let view = view as? AlertViewProtocol {
                    alertViews.append(view)
                }
            }
        }
        
        if alertViews.isEmpty {
            completion?()
        } else {
            for (index, view) in alertViews.enumerated() {
                if index == .zero {
                    view.dismiss(completion: completion)
                } else {
                    view.dismiss(completion: nil)
                }
            }
            alertViews.first?.dismiss {
                completion?()
            }
        }
    }
}
