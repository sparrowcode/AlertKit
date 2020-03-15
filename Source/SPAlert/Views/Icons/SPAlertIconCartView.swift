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

public class SPAlertIconCartView: UIView {
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        CartDraw.draw(frame: rect, resizing: .aspectFit, fillColor: self.tintColor)
    }
    
    class CartDraw: NSObject {
        
        @objc dynamic public class func draw(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 60, height: 56), resizing: ResizingBehavior = .aspectFit, fillColor: UIColor = UIColor(red: 0.349, green: 0.345, blue: 0.353, alpha: 1.000)) {
            let context = UIGraphicsGetCurrentContext()!
            context.saveGState()
            let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 72, height: 62), target: targetFrame)
            context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
            context.scaleBy(x: resizedFrame.width / 72, y: resizedFrame.height / 62)
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 3, y: 6.12))
            bezierPath.addCurve(to: CGPoint(x: 5.09, y: 8.27), controlPoint1: CGPoint(x: 3, y: 7.28), controlPoint2: CGPoint(x: 3.96, y: 8.27))
            bezierPath.addLine(to: CGPoint(x: 14.65, y: 8.27))
            bezierPath.addLine(to: CGPoint(x: 19.18, y: 39.32))
            bezierPath.addCurve(to: CGPoint(x: 25.99, y: 45.85), controlPoint1: CGPoint(x: 19.77, y: 43.34), controlPoint2: CGPoint(x: 21.89, y: 45.85))
            bezierPath.addLine(to: CGPoint(x: 58.99, y: 45.85))
            bezierPath.addCurve(to: CGPoint(x: 61.06, y: 43.73), controlPoint1: CGPoint(x: 60.1, y: 45.85), controlPoint2: CGPoint(x: 61.06, y: 44.95))
            bezierPath.addCurve(to: CGPoint(x: 58.99, y: 41.61), controlPoint1: CGPoint(x: 61.06, y: 42.52), controlPoint2: CGPoint(x: 60.1, y: 41.61))
            bezierPath.addLine(to: CGPoint(x: 26.47, y: 41.61))
            bezierPath.addCurve(to: CGPoint(x: 23.62, y: 38.76), controlPoint1: CGPoint(x: 24.86, y: 41.61), controlPoint2: CGPoint(x: 23.87, y: 40.48))
            bezierPath.addLine(to: CGPoint(x: 23.16, y: 35.79))
            bezierPath.addLine(to: CGPoint(x: 59.05, y: 35.79))
            bezierPath.addCurve(to: CGPoint(x: 65.85, y: 29.46), controlPoint1: CGPoint(x: 63.09, y: 35.79), controlPoint2: CGPoint(x: 65.2, y: 33.35))
            bezierPath.addLine(to: CGPoint(x: 68.16, y: 14.24))
            bezierPath.addCurve(to: CGPoint(x: 68.27, y: 13.16), controlPoint1: CGPoint(x: 68.21, y: 13.87), controlPoint2: CGPoint(x: 68.27, y: 13.42))
            bezierPath.addCurve(to: CGPoint(x: 65.7, y: 10.87), controlPoint1: CGPoint(x: 68.27, y: 11.81), controlPoint2: CGPoint(x: 67.25, y: 10.87))
            bezierPath.addLine(to: CGPoint(x: 19.54, y: 10.87))
            bezierPath.addLine(to: CGPoint(x: 18.98, y: 7.28))
            bezierPath.addCurve(to: CGPoint(x: 15.02, y: 4), controlPoint1: CGPoint(x: 18.7, y: 5.1), controlPoint2: CGPoint(x: 17.9, y: 4))
            bezierPath.addLine(to: CGPoint(x: 5.09, y: 4))
            bezierPath.addCurve(to: CGPoint(x: 3, y: 6.12), controlPoint1: CGPoint(x: 3.96, y: 4), controlPoint2: CGPoint(x: 3, y: 4.99))
            bezierPath.close()
            bezierPath.move(to: CGPoint(x: 23.62, y: 55.02))
            bezierPath.addCurve(to: CGPoint(x: 28.23, y: 59.6), controlPoint1: CGPoint(x: 23.62, y: 57.59), controlPoint2: CGPoint(x: 25.65, y: 59.6))
            bezierPath.addCurve(to: CGPoint(x: 32.81, y: 55.02), controlPoint1: CGPoint(x: 30.77, y: 59.6), controlPoint2: CGPoint(x: 32.81, y: 57.59))
            bezierPath.addCurve(to: CGPoint(x: 28.23, y: 50.44), controlPoint1: CGPoint(x: 32.81, y: 52.47), controlPoint2: CGPoint(x: 30.77, y: 50.44))
            bezierPath.addCurve(to: CGPoint(x: 23.62, y: 55.02), controlPoint1: CGPoint(x: 25.65, y: 50.44), controlPoint2: CGPoint(x: 23.62, y: 52.47))
            bezierPath.close()
            bezierPath.move(to: CGPoint(x: 50.06, y: 55.02))
            bezierPath.addCurve(to: CGPoint(x: 54.67, y: 50.44), controlPoint1: CGPoint(x: 50.06, y: 52.47), controlPoint2: CGPoint(x: 52.12, y: 50.44))
            bezierPath.addCurve(to: CGPoint(x: 59.28, y: 55.02), controlPoint1: CGPoint(x: 57.24, y: 50.44), controlPoint2: CGPoint(x: 59.28, y: 52.47))
            bezierPath.addCurve(to: CGPoint(x: 54.67, y: 59.6), controlPoint1: CGPoint(x: 59.28, y: 57.59), controlPoint2: CGPoint(x: 57.24, y: 59.6))
            bezierPath.addCurve(to: CGPoint(x: 50.06, y: 55.02), controlPoint1: CGPoint(x: 52.12, y: 59.6), controlPoint2: CGPoint(x: 50.06, y: 57.59))
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
