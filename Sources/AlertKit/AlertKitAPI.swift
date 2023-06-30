import UIKit

public enum AlertKitAPI {
    
    public static func present(title: String? = nil, subtitle: String? = nil, icon: AlertIcon? = nil, style: AlertViewStyle, haptic: AlertHaptic? = nil) {
        switch style {
        case .iOS16AppleMusic:
            guard let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first else { return }
            let view = AlertAppleMusic16View(title: title, subtitle: subtitle, icon: icon)
            view.haptic = haptic
            view.present(on: window)
        case .iOS17AppleMusic:
            guard let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first else { return }
            let view = AlertAppleMusic17View(title: title, subtitle: subtitle, icon: icon)
            view.haptic = haptic
            view.present(on: window)
        }
    }
}
