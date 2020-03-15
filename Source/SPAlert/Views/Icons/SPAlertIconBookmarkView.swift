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

public class SPAlertIconBookmarkView: UIView {
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        BookmarkDraw.draw(frame: rect, resizing: .aspectFit, fillColor: self.tintColor)
    }
    
    class BookmarkDraw: NSObject {
        
        @objc dynamic public class func draw(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 40, height: 53), resizing: ResizingBehavior = .aspectFit, fillColor: UIColor = UIColor(red: 0.349, green: 0.345, blue: 0.353, alpha: 1.000)) {
            let context = UIGraphicsGetCurrentContext()!
            context.saveGState()
            let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 40, height: 53), target: targetFrame)
            context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
            context.scaleBy(x: resizedFrame.width / 40, y: resizedFrame.height / 53)
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 4.15, y: 52))
            bezierPath.addCurve(to: CGPoint(x: 1, y: 48.46), controlPoint1: CGPoint(x: 2.4, y: 52), controlPoint2: CGPoint(x: 1, y: 50.93))
            bezierPath.addLine(to: CGPoint(x: 1, y: 8.67))
            bezierPath.addCurve(to: CGPoint(x: 8.6, y: 1), controlPoint1: CGPoint(x: 1, y: 3.63), controlPoint2: CGPoint(x: 3.61, y: 1))
            bezierPath.addLine(to: CGPoint(x: 31.29, y: 1))
            bezierPath.addCurve(to: CGPoint(x: 38.88, y: 8.67), controlPoint1: CGPoint(x: 36.27, y: 1), controlPoint2: CGPoint(x: 38.88, y: 3.63))
            bezierPath.addLine(to: CGPoint(x: 38.88, y: 48.46))
            bezierPath.addCurve(to: CGPoint(x: 35.71, y: 52), controlPoint1: CGPoint(x: 38.88, y: 50.93), controlPoint2: CGPoint(x: 37.46, y: 52))
            bezierPath.addCurve(to: CGPoint(x: 32.52, y: 50.32), controlPoint1: CGPoint(x: 34.39, y: 52), controlPoint2: CGPoint(x: 33.55, y: 51.3))
            bezierPath.addLine(to: CGPoint(x: 21.04, y: 39.35))
            bezierPath.addCurve(to: CGPoint(x: 19.94, y: 38.74), controlPoint1: CGPoint(x: 20.55, y: 38.91), controlPoint2: CGPoint(x: 20.24, y: 38.74))
            bezierPath.addCurve(to: CGPoint(x: 18.85, y: 39.35), controlPoint1: CGPoint(x: 19.64, y: 38.74), controlPoint2: CGPoint(x: 19.34, y: 38.88))
            bezierPath.addLine(to: CGPoint(x: 8.5, y: 49.18))
            bezierPath.addLine(to: CGPoint(x: 7.65, y: 49.97))
            bezierPath.addCurve(to: CGPoint(x: 4.15, y: 52), controlPoint1: CGPoint(x: 6.04, y: 51.46), controlPoint2: CGPoint(x: 5.31, y: 52))
            bezierPath.close()
            fillColor.setFill()
            bezierPath.fill()
            context.restoreGState()
        }
        
        @objc(StyleKitNameResizingBehavior)
        public enum ResizingBehavior: Int {
            
            case aspectFit
            case aspectFill
            case stretch
            case center
            
            public func apply(rect: CGRect, target: CGRect) -> CGRect {
                if rect == target || target == CGRect.zero {
                    return rect
                }
                
                var scales = CGSize.zero
                scales.width = abs(target.width / rect.width)
                scales.height = abs(target.height / rect.height)
                
                switch self {
                case .aspectFit:
                    scales.width = min(scales.width, scales.height)
                    scales.height = scales.width
                case .aspectFill:
                    scales.width = max(scales.width, scales.height)
                    scales.height = scales.width
                case .stretch:
                    break
                case .center:
                    scales.width = 1
                    scales.height = 1
                }
                
                var result = rect.standardized
                result.size.width *= scales.width
                result.size.height *= scales.height
                result.origin.x = target.minX + (target.width - result.width) / 2
                result.origin.y = target.minY + (target.height - result.height) / 2
                return result
            }
        }
    }
}
