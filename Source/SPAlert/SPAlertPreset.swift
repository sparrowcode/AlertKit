// The MIT License (MIT)
// Copyright © 2019 Ivan Vorobei (hello@ivanvorobei.by)
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

public enum SPAlertPreset {
    
    case done
    case heart
    
    var iconView: UIView {
        switch self {
        case .done:
            return SPAlertIconDoneView()
        case .heart:
            return SPAlertIconHeartView()
        }
    }
    
    var layout: SPAlertLayout {
        switch self {
        case .done:
            var layout = SPAlertLayout()
            layout.topSpace = 63
            layout.bottomSpace = 29
            layout.iconWidth = 112
            layout.iconHeight = 112
            layout.bottomIconSpace = 35
            return layout
        case .heart:
            var layout = SPAlertLayout()
            layout.topSpace = 49
            layout.bottomSpace = 25
            layout.iconWidth = 112
            layout.iconHeight = 77
            layout.bottomIconSpace = 35
            return layout
        }
    }
    
    var haptic: SPAlertHaptic {
        switch self {
        case .done:
            return .success
        case .heart:
            return .success
        }
    }
}

public struct SPAlertLayout {
    
    public var topSpace: CGFloat = 43
    public var bottomSpace: CGFloat = 25
    public var iconWidth: CGFloat = 100
    public var iconHeight: CGFloat = 100
    public var bottomIconSpace: CGFloat = 41
}

public protocol SPAlertIconAnimatable {
    
    func animate()
}
