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

import UIKit

/**
 SPAlert: Configuration interface.
 
 Use this for change default values. For example you want change default duration of alerts,
 set property `duration` to specific value.
 */
public class SPAlertConfiguration {
    
    // MARK: - Public
    
    /**
     SPAlert: Change default corner radius for alert views.
     */
    public static var cornerRadius: CGFloat {
        get { shared.cornerRadius }
        set { shared.cornerRadius = newValue }
    }
    
    /**
     SPAlert: Change visible duration for alerts.
     */
    public static var duration: TimeInterval {
        get { shared.duration }
        set { shared.duration = newValue }
    }
    
    // MARK: - Internal
    
    private var cornerRadius: CGFloat = 8
    private var duration: TimeInterval = 1.5
    
    // MARK: - Singltone
    
    private static let shared = SPAlertConfiguration()
    private init() {}
}
