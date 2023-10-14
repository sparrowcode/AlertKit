import SwiftUI

@available(iOS 13.0, *)
extension View {
    
    public func alert(isPresent: Binding<Bool>, view: AlertViewProtocol) -> some View {
        if isPresent.wrappedValue {
            let alertCompletion = view.completion
            let completion = {
                isPresent.wrappedValue = false
                alertCompletion?()
            }
            if let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first {
                view.present(on: window, completion: completion)
            }
        }
        return self
    }
}
