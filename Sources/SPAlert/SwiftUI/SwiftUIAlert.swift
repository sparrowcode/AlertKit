//
//  SwiftUIView.swift
//  
//
//  Created by Qi Hon on 2021/6/4.
//

import SwiftUI

@available(iOS 13.0, *)
extension View {
    public func alert(
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
    
    public func alert(isPresent: Binding<Bool>,
               title: String = "",
               message: String? = nil,
               duration: TimeInterval = 2.0,
               dismissOnTap: Bool = true,
               present: SPAlertIconPreset = .done,
               haptic: SPAlertHaptic = .none,
               layout: SPAlertLayout = .init(),
               completion: (()-> Void)? = nil
    ) -> some View {
        let alertView = SPAlertView(title: title, message: message, preset: present)
        alertView.dismissByTap = dismissOnTap
        alertView.layout = layout
        alertView.completion = completion
        
        return alert(isPresent: isPresent, alertView: alertView, duration: duration, haptic: haptic)
    }
    
    public func alert(isPresent: Binding<Bool>,
               message: String,
               duration: TimeInterval = 2.0,
               dismissOnTap: Bool = true,
               haptic: SPAlertHaptic = .none,
               completion: (()-> Void)? = nil
    ) -> some View {
        let alertView = SPAlertView(message: message)
        alertView.dismissByTap = dismissOnTap
        alertView.completion = completion
        
        return alert(isPresent: isPresent, alertView: alertView, duration: duration, haptic: haptic)
    }
}
