import UIKit

public protocol AlertViewProtocol {
    
    func present(on view: UIView, completion: @escaping ()->Void)
    
    var completion: (() -> Void)? { get set }
}

extension AlertViewProtocol where Self: UIView {
    
    func present(on view: UIView, completion: @escaping ()->Void = {}) {}
}
