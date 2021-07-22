// The MIT License (MIT)
// Copyright © 2020 Ivan Vorobei (hello@ivanvorobei.by)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// Thanks @HonQii for PR!

import SwiftUI

@available(iOS 13.0, *)
@available(iOSApplicationExtension, unavailable)
extension View {
    
    public func spAlert(
        isPresent: Binding<Bool>,
        alertView: SPAlertView,
        duration: TimeInterval = 2.0,
        haptic: SPAlertHaptic = .none
    ) -> some View {
        if isPresent.wrappedValue {
            let alertCompletion = alertView.completion
            let alertDismiss = {
                isPresent.wrappedValue = false
                alertCompletion?()
            }
            alertView.present(duration: duration, haptic: haptic, completion: alertDismiss)
        }
        return self
    }
    
    public func spAlert(isPresent: Binding<Bool>,
                        title: String = "",
                        message: String? = nil,
                        duration: TimeInterval = 2.0,
                        dismissOnTap: Bool = true,
                        preset: SPAlertIconPreset = .done,
                        haptic: SPAlertHaptic = .none,
                        layout: SPAlertLayout? = nil,
                        completion: (()-> Void)? = nil
    ) -> some View {
        let alertView = SPAlertView(title: title, message: message, preset: preset)
        alertView.dismissByTap = dismissOnTap
        alertView.layout = layout ??  SPAlertLayout(for: preset)
        alertView.completion = completion
        
        return spAlert(isPresent: isPresent, alertView: alertView, duration: duration, haptic: haptic)
    }
    
    public func spAlert(isPresent: Binding<Bool>,
                        message: String,
                        duration: TimeInterval = 2.0,
                        dismissOnTap: Bool = true,
                        haptic: SPAlertHaptic = .none,
                        completion: (()-> Void)? = nil
    ) -> some View {
        
        let alertView = SPAlertView(message: message)
        alertView.dismissByTap = dismissOnTap
        alertView.completion = completion
        
        return spAlert(isPresent: isPresent, alertView: alertView, duration: duration, haptic: haptic)
    }
}
