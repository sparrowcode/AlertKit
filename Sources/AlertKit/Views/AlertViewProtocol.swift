import UIKit

public protocol AlertViewProtocol {
    
    func present(on view: UIView, completion: (()->Void)?)
    func dismiss(completion: (()->Void)?)
}
