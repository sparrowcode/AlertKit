// The MIT License (MIT)
// Copyright © 2019 Ivan Vorobei (ivanvorobei@icloud.com)
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
Defaults values, icons and vibro for ready-using presets.
*/
public enum SPAlertPreset {
    
    case done
    case heart
    case doc
    case bookmark
    case add
    case error
    
    /**
     View for preset.
     */
    var iconView: UIView {
        switch self {
        case .done:
            return SPAlertIconDoneView()
        case .heart:
            return SPAlertIconHeartView()
        case .doc:
            return SPAlertIconDocView()
        case .bookmark:
            return SPAlertIconBookmarkView()
        case .add:
            return SPAlertIconAddView()
        case .error:
            return SPAlertIconErrorView()
        }
    }
    
    /**
     Layout for preset. Include spacings and icon size.
     */
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
        case .doc:
            var layout = SPAlertLayout()
            layout.topSpace = 49
            layout.bottomSpace = 29
            layout.iconWidth = 112
            layout.iconHeight = 77
            layout.bottomIconSpace = 35
            return layout
        case .bookmark:
            var layout = SPAlertLayout()
            layout.topSpace = 57
            layout.bottomSpace = 29
            layout.iconWidth = 112
            layout.iconHeight = 94
            layout.bottomIconSpace = 36
            return layout
        case .add:
            var layout = SPAlertLayout()
            layout.topSpace = 63
            layout.bottomSpace = 29
            layout.iconWidth = 106
            layout.iconHeight = 106
            layout.bottomIconSpace = 39
            return layout
        case .error:
            var layout = SPAlertLayout()
            layout.topSpace = 63
            layout.bottomSpace = 29
            layout.iconWidth = 100
            layout.iconHeight = 100
            layout.bottomIconSpace = 37
            return layout
        }
    }
    
    /**
     Default vibro. Can customize after create with preset.
     */
    var haptic: SPAlertHaptic {
        switch self {
        case .done:
            return .success
        case .heart:
            return .success
        case .doc:
            return .success
        case .bookmark:
            return .success
        case .add:
            return .success
        case .error:
            return .error
        }
    }
}
