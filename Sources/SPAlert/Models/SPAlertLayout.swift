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
 SPAlert: Layout model for alert view.
 */
open class SPAlertLayout {
    
    /**
     SPAlert: Icon size.
     */
    open var iconSize: CGSize
    
    /**
     SPAlert: Alert margings for each side.
     */
    open var margins: UIEdgeInsets
    
    /**
     SPAlert: Space between icon and title if both available.
     */
    open var spaceBetweenIconAndTitle: CGFloat
    
    public init(iconSize: CGSize, margins: UIEdgeInsets, spaceBetweenIconAndTitle: CGFloat) {
        self.iconSize = iconSize
        self.margins = margins
        self.spaceBetweenIconAndTitle = spaceBetweenIconAndTitle
    }
}
