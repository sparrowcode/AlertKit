import UIKit

public enum AlertHaptic {
    
    case success
    case warning
    case error
    case none
    
    func impact() {
        #if os(iOS)
        let generator = UINotificationFeedbackGenerator()
        switch self {
        case .success:
            generator.notificationOccurred(UINotificationFeedbackGenerator.FeedbackType.success)
        case .warning:
            generator.notificationOccurred(UINotificationFeedbackGenerator.FeedbackType.warning)
        case .error:
            generator.notificationOccurred(UINotificationFeedbackGenerator.FeedbackType.error)
        case .none:
            break
        }
        #endif
    }
}
