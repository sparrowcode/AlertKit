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

public class SPAlertIconEjectView: UIView {
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        EjectDraw.draw(frame: rect, resizing: .aspectFit, fillColor: self.tintColor)
    }
    
    class EjectDraw: NSObject {
        
        @objc dynamic public class func draw(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 60, height: 56), resizing: ResizingBehavior = .aspectFit, fillColor: UIColor = UIColor(red: 0.349, green: 0.345, blue: 0.353, alpha: 1.000)) {
            let context = UIGraphicsGetCurrentContext()!
            context.saveGState()
            let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 60, height: 60), target: targetFrame)
            context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
            context.scaleBy(x: resizedFrame.width / 60, y: resizedFrame.height / 60)
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 52.91, y: 34.64))
            bezierPath.addCurve(to: CGPoint(x: 57.54, y: 30.39), controlPoint1: CGPoint(x: 55.73, y: 34.64), controlPoint2: CGPoint(x: 57.54, y: 32.88))
            bezierPath.addCurve(to: CGPoint(x: 56.01, y: 26.96), controlPoint1: CGPoint(x: 57.54, y: 29.26), controlPoint2: CGPoint(x: 56.98, y: 27.98))
            bezierPath.addLine(to: CGPoint(x: 34.16, y: 4.58))
            bezierPath.addCurve(to: CGPoint(x: 29.33, y: 2), controlPoint1: CGPoint(x: 32.35, y: 2.88), controlPoint2: CGPoint(x: 31.06, y: 2))
            bezierPath.addCurve(to: CGPoint(x: 24.53, y: 4.58), controlPoint1: CGPoint(x: 27.63, y: 2), controlPoint2: CGPoint(x: 26.28, y: 2.91))
            bezierPath.addLine(to: CGPoint(x: 2.85, y: 26.76))
            bezierPath.addCurve(to: CGPoint(x: 1.12, y: 30.39), controlPoint1: CGPoint(x: 1.76, y: 27.81), controlPoint2: CGPoint(x: 1.09, y: 29.19))
            bezierPath.addCurve(to: CGPoint(x: 5.75, y: 34.64), controlPoint1: CGPoint(x: 1.12, y: 32.88), controlPoint2: CGPoint(x: 2.93, y: 34.64))
            bezierPath.addLine(to: CGPoint(x: 52.91, y: 34.64))
            bezierPath.close()
            bezierPath.move(to: CGPoint(x: 51.86, y: 40.73))
            bezierPath.addCurve(to: CGPoint(x: 57.69, y: 46.41), controlPoint1: CGPoint(x: 55.49, y: 40.73), controlPoint2: CGPoint(x: 57.69, y: 42.87))
            bezierPath.addLine(to: CGPoint(x: 57.69, y: 52.42))
            bezierPath.addCurve(to: CGPoint(x: 51.86, y: 58.13), controlPoint1: CGPoint(x: 57.69, y: 56.11), controlPoint2: CGPoint(x: 55.49, y: 58.13))
            bezierPath.addLine(to: CGPoint(x: 6.86, y: 58.13))
            bezierPath.addCurve(to: CGPoint(x: 1, y: 52.42), controlPoint1: CGPoint(x: 3.23, y: 58.13), controlPoint2: CGPoint(x: 1, y: 56.08))
            bezierPath.addLine(to: CGPoint(x: 1, y: 46.41))
            bezierPath.addCurve(to: CGPoint(x: 6.86, y: 40.73), controlPoint1: CGPoint(x: 1, y: 42.87), controlPoint2: CGPoint(x: 3.23, y: 40.73))
            bezierPath.addLine(to: CGPoint(x: 51.86, y: 40.73))
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
