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

public class SPAlertIconQuestionView: UIView {
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        QuestionDraw.draw(frame: rect, resizing: .aspectFit, fillColor: self.tintColor)
    }
    
    class QuestionDraw: NSObject {
        
        @objc dynamic public class func draw(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 60, height: 56), resizing: ResizingBehavior = .aspectFit, fillColor: UIColor = UIColor(red: 0.349, green: 0.345, blue: 0.353, alpha: 1.000)) {
            let context = UIGraphicsGetCurrentContext()!
            context.saveGState()
            let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 76, height: 74), target: targetFrame)
            context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
            context.scaleBy(x: resizedFrame.width / 76, y: resizedFrame.height / 74)
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 30.56, y: 68.4))
            bezierPath.addCurve(to: CGPoint(x: 43.85, y: 68.34), controlPoint1: CGPoint(x: 34.48, y: 72.31), controlPoint2: CGPoint(x: 39.94, y: 72.25))
            bezierPath.addLine(to: CGPoint(x: 68.34, y: 43.85))
            bezierPath.addCurve(to: CGPoint(x: 68.4, y: 30.56), controlPoint1: CGPoint(x: 72.25, y: 39.94), controlPoint2: CGPoint(x: 72.31, y: 34.45))
            bezierPath.addLine(to: CGPoint(x: 43.73, y: 5.86))
            bezierPath.addCurve(to: CGPoint(x: 30.44, y: 5.99), controlPoint1: CGPoint(x: 39.81, y: 1.98), controlPoint2: CGPoint(x: 34.36, y: 2.07))
            bezierPath.addLine(to: CGPoint(x: 5.99, y: 30.44))
            bezierPath.addCurve(to: CGPoint(x: 5.86, y: 43.73), controlPoint1: CGPoint(x: 2.07, y: 34.36), controlPoint2: CGPoint(x: 1.98, y: 39.81))
            bezierPath.addLine(to: CGPoint(x: 30.56, y: 68.4))
            bezierPath.close()
            bezierPath.move(to: CGPoint(x: 36.21, y: 45.43))
            bezierPath.addCurve(to: CGPoint(x: 33.62, y: 42.9), controlPoint1: CGPoint(x: 34.54, y: 45.43), controlPoint2: CGPoint(x: 33.62, y: 44.56))
            bezierPath.addLine(to: CGPoint(x: 33.62, y: 42.47))
            bezierPath.addCurve(to: CGPoint(x: 37.66, y: 35.96), controlPoint1: CGPoint(x: 33.62, y: 39.29), controlPoint2: CGPoint(x: 35.34, y: 37.56))
            bezierPath.addLine(to: CGPoint(x: 38.47, y: 35.4))
            bezierPath.addCurve(to: CGPoint(x: 41.88, y: 30.69), controlPoint1: CGPoint(x: 40.78, y: 33.78), controlPoint2: CGPoint(x: 41.88, y: 32.69))
            bezierPath.addCurve(to: CGPoint(x: 37.01, y: 26.59), controlPoint1: CGPoint(x: 41.88, y: 28.25), controlPoint2: CGPoint(x: 39.97, y: 26.59))
            bezierPath.addCurve(to: CGPoint(x: 32.23, y: 29.42), controlPoint1: CGPoint(x: 34.85, y: 26.59), controlPoint2: CGPoint(x: 33.22, y: 27.67))
            bezierPath.addCurve(to: CGPoint(x: 29.05, y: 31.61), controlPoint1: CGPoint(x: 31.18, y: 30.66), controlPoint2: CGPoint(x: 30.9, y: 31.61))
            bezierPath.addCurve(to: CGPoint(x: 26.83, y: 29.39), controlPoint1: CGPoint(x: 27.97, y: 31.61), controlPoint2: CGPoint(x: 26.83, y: 30.84))
            bezierPath.addCurve(to: CGPoint(x: 27.08, y: 27.79), controlPoint1: CGPoint(x: 26.83, y: 28.84), controlPoint2: CGPoint(x: 26.92, y: 28.31))
            bezierPath.addCurve(to: CGPoint(x: 37.19, y: 22.18), controlPoint1: CGPoint(x: 27.91, y: 24.8), controlPoint2: CGPoint(x: 31.64, y: 22.18))
            bezierPath.addCurve(to: CGPoint(x: 47.49, y: 30.44), controlPoint1: CGPoint(x: 42.71, y: 22.18), controlPoint2: CGPoint(x: 47.49, y: 25.07))
            bezierPath.addCurve(to: CGPoint(x: 42.13, y: 38.3), controlPoint1: CGPoint(x: 47.49, y: 34.33), controlPoint2: CGPoint(x: 45.24, y: 36.18))
            bezierPath.addCurve(to: CGPoint(x: 38.8, y: 42.74), controlPoint1: CGPoint(x: 39.88, y: 39.81), controlPoint2: CGPoint(x: 38.8, y: 40.92))
            bezierPath.addLine(to: CGPoint(x: 38.8, y: 43.14))
            bezierPath.addCurve(to: CGPoint(x: 36.21, y: 45.43), controlPoint1: CGPoint(x: 38.8, y: 44.41), controlPoint2: CGPoint(x: 37.84, y: 45.43))
            bezierPath.close()
            bezierPath.move(to: CGPoint(x: 36.33, y: 54.71))
            bezierPath.addCurve(to: CGPoint(x: 32.85, y: 51.38), controlPoint1: CGPoint(x: 34.54, y: 54.71), controlPoint2: CGPoint(x: 32.85, y: 53.29))
            bezierPath.addCurve(to: CGPoint(x: 36.33, y: 48.05), controlPoint1: CGPoint(x: 32.85, y: 49.47), controlPoint2: CGPoint(x: 34.51, y: 48.05))
            bezierPath.addCurve(to: CGPoint(x: 39.78, y: 51.38), controlPoint1: CGPoint(x: 38.12, y: 48.05), controlPoint2: CGPoint(x: 39.78, y: 49.43))
            bezierPath.addCurve(to: CGPoint(x: 36.33, y: 54.71), controlPoint1: CGPoint(x: 39.78, y: 53.32), controlPoint2: CGPoint(x: 38.09, y: 54.71))
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
