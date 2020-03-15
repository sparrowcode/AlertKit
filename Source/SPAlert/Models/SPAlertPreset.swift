// The MIT License (MIT)
// Copyright © 2019 Ivan Varabei (varabeis@icloud.com)
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
    case moon
    case star
    case exclamation
    case flag
    case message
    case question
    case bolt
    case add
    case error
    case shuffle
    case `repeat`
    case eject
    case card
    case rotate
    case like
    case dislike
    case privacy
    case cart
    case search
    
    /**
     View for preset. Wrap to `UIView`.
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
        case .moon:
            return SPAlertIconMoonView()
        case .message:
            return SPAlertIconMessageView()
        case .exclamation:
            return SPAlertIconExclamationView()
        case .star:
            return SPAlertIconStarView()
        case .error:
            return SPAlertIconErrorView()
        case .shuffle:
            return SPAlertIconShuffleView()
        case .repeat:
            return SPAlertIconRepeatView()
        case .flag:
            return SPAlertIconFlagView()
        case .question:
            return SPAlertIconQuestionView()
        case .bolt:
            return SPAlertIconBoltView()
        case .eject:
            return SPAlertIconEjectView()
        case .card:
            return SPAlertIconCardView()
        case .rotate:
            return SPAlertIconRotateView()
        case .like:
            return SPAlertIconLikeView()
        case .dislike:
            return SPAlertIconDislikeView()
        case .privacy:
            return SPAlertIconPrivacyView()
        case .cart:
            return SPAlertIconCartView()
        case .search:
            return SPAlertIconSearchView()
        }
    }
    
    /**
     Layout for preset. Include spacings and icon size.
     Size of frame `250` to `250`, it fix size. Not using proportional. Set fix in points.
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
        case .exclamation:
            var layout = SPAlertLayout()
            layout.topSpace = 46
            layout.bottomSpace = 33
            layout.iconWidth = 112
            layout.iconHeight = 90
            layout.bottomIconSpace = 31
            return layout
        case .message:
            var layout = SPAlertLayout()
            layout.topSpace = 46
            layout.bottomSpace = 33
            layout.iconWidth = 112
            layout.iconHeight = 90
            layout.bottomIconSpace = 31
            return layout
        case .question:
            var layout = SPAlertLayout()
            layout.topSpace = 46
            layout.bottomSpace = 33
            layout.iconWidth = 112
            layout.iconHeight = 102
            layout.bottomIconSpace = 31
            return layout
        case .doc:
            var layout = SPAlertLayout()
            layout.topSpace = 49
            layout.bottomSpace = 29
            layout.iconWidth = 112
            layout.iconHeight = 77
            layout.bottomIconSpace = 35
            return layout
        case .rotate:
            var layout = SPAlertLayout()
            layout.topSpace = 46
            layout.bottomSpace = 29
            layout.iconWidth = 112
            layout.iconHeight = 112
            layout.bottomIconSpace = 35
            return layout
        case .eject:
            var layout = SPAlertLayout()
            layout.topSpace = 48
            layout.bottomSpace = 31
            layout.iconWidth = 112
            layout.iconHeight = 77
            layout.bottomIconSpace = 32
            return layout
        case .card:
            var layout = SPAlertLayout()
            layout.topSpace = 45
            layout.bottomSpace = 31
            layout.iconWidth = 108
            layout.iconHeight = 108
            layout.bottomIconSpace = 25
            return layout
        case .cart:
            var layout = SPAlertLayout()
            layout.topSpace = 45
            layout.bottomSpace = 31
            layout.iconWidth = 108
            layout.iconHeight = 108
            layout.bottomIconSpace = 25
            return layout
        case .flag:
            var layout = SPAlertLayout()
            layout.topSpace = 49
            layout.bottomSpace = 31
            layout.iconWidth = 112
            layout.iconHeight = 88
            layout.bottomIconSpace = 35
            return layout
        case .like:
            var layout = SPAlertLayout()
            layout.topSpace = 49
            layout.bottomSpace = 31
            layout.iconWidth = 112
            layout.iconHeight = 88
            layout.bottomIconSpace = 35
            return layout
        case .dislike:
            var layout = SPAlertLayout()
            layout.topSpace = 49
            layout.bottomSpace = 31
            layout.iconWidth = 112
            layout.iconHeight = 88
            layout.bottomIconSpace = 35
            return layout
        case .privacy:
            var layout = SPAlertLayout()
            layout.topSpace = 47
            layout.bottomSpace = 31
            layout.iconWidth = 106
            layout.iconHeight = 106
            layout.bottomIconSpace = 32
            return layout
        case .bookmark:
            var layout = SPAlertLayout()
            layout.topSpace = 57
            layout.bottomSpace = 29
            layout.iconWidth = 112
            layout.iconHeight = 90
            layout.bottomIconSpace = 36
            return layout
        case .bolt:
            var layout = SPAlertLayout()
            layout.topSpace = 45
            layout.bottomSpace = 27
            layout.iconWidth = 116
            layout.iconHeight = 116
            layout.bottomIconSpace = 34
            return layout
        case .moon:
            var layout = SPAlertLayout()
            layout.topSpace = 49
            layout.bottomSpace = 27
            layout.iconWidth = 112
            layout.iconHeight = 88
            layout.bottomIconSpace = 35
            return layout
        case .star:
            var layout = SPAlertLayout()
            layout.topSpace = 49
            layout.bottomSpace = 31
            layout.iconWidth = 112
            layout.iconHeight = 92
            layout.bottomIconSpace = 35
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
        case .shuffle:
            var layout = SPAlertLayout()
            layout.topSpace = 63
            layout.bottomSpace = 29
            layout.iconWidth = 86
            layout.iconHeight = 86
            layout.bottomIconSpace = 39
            return layout
        case .repeat:
            var layout = SPAlertLayout()
            layout.topSpace = 63
            layout.bottomSpace = 29
            layout.iconWidth = 86
            layout.iconHeight = 86
            layout.bottomIconSpace = 39
            return layout
        case .search:
            var layout = SPAlertLayout()
            layout.topSpace = 42
            layout.bottomSpace = 29
            layout.iconWidth = 98
            layout.iconHeight = 98
            layout.bottomIconSpace = 39
            return layout
        }
    }
    
    /**
     Default haptic. Can customize after create with preset.
     */
    var haptic: SPAlertHaptic {
        switch self {
        case .done:
            return .success
        case .heart:
            return .success
        case .doc:
            return .success
        case .message:
            return .success
        case .bookmark:
            return .success
        case .add:
            return .success
        case .star:
            return .success
        case .moon:
            return .success
        case .exclamation:
            return .warning
        case .question:
            return .warning
        case .error:
            return .error
        case .shuffle:
            return .success
        case .eject:
            return .warning
        case .repeat:
            return .success
        case .flag:
            return .success
        case .bolt:
            return .success
        case .card:
            return .success
        case .search:
            return .success
        case .rotate:
            return .success
        case .like:
            return .success
        case .dislike:
            return .error
        case .privacy:
            return .success
        case .cart:
            return .success
        }
    }
}
