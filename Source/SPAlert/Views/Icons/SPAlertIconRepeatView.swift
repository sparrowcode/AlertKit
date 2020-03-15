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

public class SPAlertIconRepeatView: UIView {
    
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
            let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 73, height: 64), target: targetFrame)
            context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
            context.scaleBy(x: resizedFrame.width / 73, y: resizedFrame.height / 64)
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 1, y: 29.76))
            bezierPath.addCurve(to: CGPoint(x: 4.49, y: 33.25), controlPoint1: CGPoint(x: 1, y: 31.69), controlPoint2: CGPoint(x: 2.56, y: 33.25))
            bezierPath.addCurve(to: CGPoint(x: 7.98, y: 29.76), controlPoint1: CGPoint(x: 6.43, y: 33.25), controlPoint2: CGPoint(x: 7.98, y: 31.69))
            bezierPath.addLine(to: CGPoint(x: 7.98, y: 27.66))
            bezierPath.addCurve(to: CGPoint(x: 16.68, y: 19.28), controlPoint1: CGPoint(x: 7.98, y: 22.61), controlPoint2: CGPoint(x: 11.47, y: 19.28))
            bezierPath.addLine(to: CGPoint(x: 40.61, y: 19.28))
            bezierPath.addLine(to: CGPoint(x: 40.61, y: 25.92))
            bezierPath.addCurve(to: CGPoint(x: 43.47, y: 28.71), controlPoint1: CGPoint(x: 40.61, y: 27.63), controlPoint2: CGPoint(x: 41.72, y: 28.71))
            bezierPath.addCurve(to: CGPoint(x: 45.62, y: 27.91), controlPoint1: CGPoint(x: 44.23, y: 28.71), controlPoint2: CGPoint(x: 45.02, y: 28.42))
            bezierPath.addLine(to: CGPoint(x: 57.62, y: 18.01))
            bezierPath.addCurve(to: CGPoint(x: 57.62, y: 13.76), controlPoint1: CGPoint(x: 59.05, y: 16.87), controlPoint2: CGPoint(x: 59.02, y: 14.97))
            bezierPath.addLine(to: CGPoint(x: 45.62, y: 3.79))
            bezierPath.addCurve(to: CGPoint(x: 43.47, y: 3), controlPoint1: CGPoint(x: 45.02, y: 3.32), controlPoint2: CGPoint(x: 44.23, y: 3))
            bezierPath.addCurve(to: CGPoint(x: 40.61, y: 5.82), controlPoint1: CGPoint(x: 41.72, y: 3), controlPoint2: CGPoint(x: 40.61, y: 4.11))
            bezierPath.addLine(to: CGPoint(x: 40.61, y: 12.39))
            bezierPath.addLine(to: CGPoint(x: 17.35, y: 12.39))
            bezierPath.addCurve(to: CGPoint(x: 1, y: 27.15), controlPoint1: CGPoint(x: 7.35, y: 12.39), controlPoint2: CGPoint(x: 1, y: 18.14))
            bezierPath.addLine(to: CGPoint(x: 1, y: 29.76))
            bezierPath.close()
            bezierPath.move(to: CGPoint(x: 30.74, y: 38.26))
            bezierPath.addLine(to: CGPoint(x: 30.74, y: 44.83))
            bezierPath.addLine(to: CGPoint(x: 54.67, y: 44.83))
            bezierPath.addCurve(to: CGPoint(x: 63.37, y: 36.45), controlPoint1: CGPoint(x: 59.87, y: 44.83), controlPoint2: CGPoint(x: 63.37, y: 41.47))
            bezierPath.addLine(to: CGPoint(x: 63.37, y: 34.36))
            bezierPath.addCurve(to: CGPoint(x: 66.86, y: 30.83), controlPoint1: CGPoint(x: 63.37, y: 32.39), controlPoint2: CGPoint(x: 64.92, y: 30.83))
            bezierPath.addCurve(to: CGPoint(x: 70.35, y: 34.36), controlPoint1: CGPoint(x: 68.79, y: 30.83), controlPoint2: CGPoint(x: 70.35, y: 32.39))
            bezierPath.addLine(to: CGPoint(x: 70.35, y: 36.96))
            bezierPath.addCurve(to: CGPoint(x: 54, y: 51.72), controlPoint1: CGPoint(x: 70.35, y: 45.94), controlPoint2: CGPoint(x: 64, y: 51.72))
            bezierPath.addLine(to: CGPoint(x: 30.74, y: 51.72))
            bezierPath.addLine(to: CGPoint(x: 30.74, y: 58.35))
            bezierPath.addCurve(to: CGPoint(x: 27.88, y: 61.14), controlPoint1: CGPoint(x: 30.74, y: 60.07), controlPoint2: CGPoint(x: 29.66, y: 61.14))
            bezierPath.addCurve(to: CGPoint(x: 25.92, y: 60.48), controlPoint1: CGPoint(x: 27.19, y: 61.14), controlPoint2: CGPoint(x: 26.47, y: 60.91))
            bezierPath.addLine(to: CGPoint(x: 13.76, y: 50.39))
            bezierPath.addCurve(to: CGPoint(x: 13.76, y: 46.13), controlPoint1: CGPoint(x: 12.3, y: 49.18), controlPoint2: CGPoint(x: 12.33, y: 47.31))
            bezierPath.addLine(to: CGPoint(x: 25.76, y: 36.23))
            bezierPath.addCurve(to: CGPoint(x: 27.88, y: 35.47), controlPoint1: CGPoint(x: 26.33, y: 35.75), controlPoint2: CGPoint(x: 27.12, y: 35.47))
            bezierPath.addCurve(to: CGPoint(x: 30.74, y: 38.26), controlPoint1: CGPoint(x: 29.66, y: 35.47), controlPoint2: CGPoint(x: 30.74, y: 36.55))
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
