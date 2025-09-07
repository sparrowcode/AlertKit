import SwiftUI
import UIKit

@available(iOS 13.0, *)
extension View {

    public func alert(
        isPresent: Binding<Bool>,
        view: AlertViewProtocol,
        completion: (() -> Void)? = nil
    ) -> some View {
        // Perform side effects asynchronously to avoid state changes during view updates
        DispatchQueue.main.async {
            if isPresent.wrappedValue {
                let wrapperCompletion = {
                    isPresent.wrappedValue = false
                    completion?()
                }
                if let window = UIApplication.shared.windows.first(where: {
                    $0.isKeyWindow
                }) {
                    view.present(on: window, completion: wrapperCompletion)
                }
            } else {
                // Programmatically dismiss any active alerts when Binding flips to false
                AlertKitAPI.dismissAllAlerts(completion: completion)
            }
        }
        return self
    }
}
