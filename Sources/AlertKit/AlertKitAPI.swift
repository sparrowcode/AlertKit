import UIKit

public enum AlertKitAPI {
	
	public static func present(
		title: String? = nil,
		subtitle: String? = nil,
		icon: AlertIcon? = nil,
		style: AlertViewStyle,
		position: AlertPosition = .bottom,
		haptic: AlertHaptic = .none,
		duration: TimeInterval = 1.5,
		cornerRadius: CGFloat = 8,
		completion: (()->Void)? = nil
	) {
		
		guard let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first else { return }
		
		switch style {
		case .iOS16AppleMusic:
			let view = AlertAppleMusic16View(title: title, subtitle: subtitle, icon: icon)
			view.haptic = haptic
			view.duration = duration
			view.layer.cornerRadius = cornerRadius
			view.present(on: window) {
				completion?()
			}
		case .iOS17AppleMusic:
			let view = AlertAppleMusic17View(title: title, subtitle: subtitle, icon: icon)
			view.haptic = haptic
			view.duration = duration
			view.layer.cornerRadius = cornerRadius
			view.present(on: window, position: position) {
				completion?()
			}
		}
	}
	
}
