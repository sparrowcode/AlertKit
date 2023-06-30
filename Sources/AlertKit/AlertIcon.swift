import UIKit

public enum AlertIcon: Equatable {
    
    case done
    case error
    case heart
    case spinnerSmall
    case spinnerLarge
    
    case custom(_ image: UIImage)
    
    func createView(lineThick: CGFloat) -> UIView {
        switch self {
        case .done: return AlertIconDoneView(lineThick: lineThick)
        case .error: return AlertIconErrorView(lineThick: lineThick)
        case .heart: return AlertIconHeartView()
        case .spinnerSmall: return AlertSpinnerView(style: .medium)
        case .spinnerLarge: return AlertSpinnerView(style: .large)
        case .custom(let image):
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            return imageView
        }
    }
}

public protocol AlertIconAnimatable {

    func animate()
}
