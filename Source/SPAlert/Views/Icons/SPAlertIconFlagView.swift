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

public class SPAlertIconFlagView: UIView {
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        ShuffleDraw.draw(frame: rect, resizing: .aspectFit, fillColor: self.tintColor)
    }
    
    class ShuffleDraw: NSObject {
        
        @objc dynamic public class func draw(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 60, height: 56), resizing: ResizingBehavior = .aspectFit, fillColor: UIColor = UIColor(red: 0.349, green: 0.345, blue: 0.353, alpha: 1.000)) {
            let context = UIGraphicsGetCurrentContext()!
            context.saveGState()
            let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 51, height: 55), target: targetFrame)
            context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
            context.scaleBy(x: resizedFrame.width / 51, y: resizedFrame.height / 55)
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 3.94, y: 53))
            bezierPath.addCurve(to: CGPoint(x: 2, y: 51.09), controlPoint1: CGPoint(x: 2.89, y: 53), controlPoint2: CGPoint(x: 2, y: 52.13))
            bezierPath.addLine(to: CGPoint(x: 2, y: 8.73))
            bezierPath.addCurve(to: CGPoint(x: 4.91, y: 4.3), controlPoint1: CGPoint(x: 2, y: 6.41), controlPoint2: CGPoint(x: 3.15, y: 5.09))
            bezierPath.addLine(to: CGPoint(x: 5.25, y: 4.15))
            bezierPath.addCurve(to: CGPoint(x: 12.32, y: 3), controlPoint1: CGPoint(x: 7.03, y: 3.38), controlPoint2: CGPoint(x: 8.59, y: 3))
            bezierPath.addCurve(to: CGPoint(x: 36.63, y: 7.61), controlPoint1: CGPoint(x: 21.78, y: 3), controlPoint2: CGPoint(x: 27.66, y: 7.61))
            bezierPath.addCurve(to: CGPoint(x: 44.61, y: 6.54), controlPoint1: CGPoint(x: 41.02, y: 7.61), controlPoint2: CGPoint(x: 43.36, y: 6.54))
            bezierPath.addCurve(to: CGPoint(x: 47.26, y: 8.71), controlPoint1: CGPoint(x: 46.09, y: 6.54), controlPoint2: CGPoint(x: 47.26, y: 7.33))
            bezierPath.addLine(to: CGPoint(x: 47.26, y: 34.57))
            bezierPath.addCurve(to: CGPoint(x: 44.35, y: 39.03), controlPoint1: CGPoint(x: 47.26, y: 36.92), controlPoint2: CGPoint(x: 46.11, y: 38.24))
            bezierPath.addLine(to: CGPoint(x: 44.01, y: 39.19))
            bezierPath.addCurve(to: CGPoint(x: 36.96, y: 40.33), controlPoint1: CGPoint(x: 42.23, y: 39.95), controlPoint2: CGPoint(x: 40.7, y: 40.33))
            bezierPath.addCurve(to: CGPoint(x: 12.65, y: 35.72), controlPoint1: CGPoint(x: 27.99, y: 40.33), controlPoint2: CGPoint(x: 22.08, y: 35.72))
            bezierPath.addCurve(to: CGPoint(x: 5.87, y: 36.92), controlPoint1: CGPoint(x: 8.91, y: 35.72), controlPoint2: CGPoint(x: 6.51, y: 36.64))
            bezierPath.addLine(to: CGPoint(x: 5.87, y: 51.09))
            bezierPath.addCurve(to: CGPoint(x: 3.94, y: 53), controlPoint1: CGPoint(x: 5.87, y: 52.16), controlPoint2: CGPoint(x: 5.01, y: 53))
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
