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

public class SPAlertIconShuffleView: UIView {
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        RepeatDraw.draw(frame: rect, resizing: .aspectFit, fillColor: self.tintColor)
    }
    
    class RepeatDraw: NSObject {
        
        @objc dynamic public class func draw(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 60, height: 56), resizing: ResizingBehavior = .aspectFit, fillColor: UIColor = UIColor(red: 0.349, green: 0.345, blue: 0.353, alpha: 1.000)) {
            let context = UIGraphicsGetCurrentContext()!
            context.saveGState()
            let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 76, height: 60), target: targetFrame)
            context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
            context.scaleBy(x: resizedFrame.width / 76, y: resizedFrame.height / 60)
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 1, y: 46.28))
            bezierPath.addCurve(to: CGPoint(x: 4.62, y: 42.94), controlPoint1: CGPoint(x: 1, y: 44.32), controlPoint2: CGPoint(x: 2.47, y: 42.94))
            bezierPath.addLine(to: CGPoint(x: 11.73, y: 42.94))
            bezierPath.addCurve(to: CGPoint(x: 19.06, y: 39.01), controlPoint1: CGPoint(x: 14.65, y: 42.94), controlPoint2: CGPoint(x: 16.52, y: 41.93))
            bezierPath.addLine(to: CGPoint(x: 26.39, y: 30.46))
            bezierPath.addLine(to: CGPoint(x: 19.06, y: 21.93))
            bezierPath.addCurve(to: CGPoint(x: 11.73, y: 18.01), controlPoint1: CGPoint(x: 16.55, y: 19.02), controlPoint2: CGPoint(x: 14.68, y: 18.01))
            bezierPath.addLine(to: CGPoint(x: 4.62, y: 18.01))
            bezierPath.addCurve(to: CGPoint(x: 1, y: 14.66), controlPoint1: CGPoint(x: 2.47, y: 18.01), controlPoint2: CGPoint(x: 1, y: 16.63))
            bezierPath.addCurve(to: CGPoint(x: 4.62, y: 11.32), controlPoint1: CGPoint(x: 1, y: 12.67), controlPoint2: CGPoint(x: 2.44, y: 11.32))
            bezierPath.addLine(to: CGPoint(x: 11.58, y: 11.32))
            bezierPath.addCurve(to: CGPoint(x: 23.88, y: 17.33), controlPoint1: CGPoint(x: 16.88, y: 11.32), controlPoint2: CGPoint(x: 20.04, y: 12.89))
            bezierPath.addLine(to: CGPoint(x: 30.74, y: 25.37))
            bezierPath.addLine(to: CGPoint(x: 37.64, y: 17.33))
            bezierPath.addCurve(to: CGPoint(x: 49.94, y: 11.32), controlPoint1: CGPoint(x: 41.42, y: 12.89), controlPoint2: CGPoint(x: 44.61, y: 11.32))
            bezierPath.addLine(to: CGPoint(x: 55.58, y: 11.32))
            bezierPath.addLine(to: CGPoint(x: 55.58, y: 4.7))
            bezierPath.addCurve(to: CGPoint(x: 58.31, y: 2), controlPoint1: CGPoint(x: 55.58, y: 3.04), controlPoint2: CGPoint(x: 56.63, y: 2))
            bezierPath.addCurve(to: CGPoint(x: 60.4, y: 2.77), controlPoint1: CGPoint(x: 59.05, y: 2), controlPoint2: CGPoint(x: 59.81, y: 2.28))
            bezierPath.addLine(to: CGPoint(x: 71.99, y: 12.4))
            bezierPath.addCurve(to: CGPoint(x: 71.99, y: 16.5), controlPoint1: CGPoint(x: 73.37, y: 13.56), controlPoint2: CGPoint(x: 73.37, y: 15.37))
            bezierPath.addLine(to: CGPoint(x: 60.4, y: 26.07))
            bezierPath.addCurve(to: CGPoint(x: 58.31, y: 26.84), controlPoint1: CGPoint(x: 59.81, y: 26.56), controlPoint2: CGPoint(x: 59.05, y: 26.84))
            bezierPath.addCurve(to: CGPoint(x: 55.58, y: 24.14), controlPoint1: CGPoint(x: 56.63, y: 26.84), controlPoint2: CGPoint(x: 55.58, y: 25.8))
            bezierPath.addLine(to: CGPoint(x: 55.58, y: 17.98))
            bezierPath.addLine(to: CGPoint(x: 50.12, y: 17.98))
            bezierPath.addCurve(to: CGPoint(x: 42.72, y: 21.66), controlPoint1: CGPoint(x: 47.04, y: 17.98), controlPoint2: CGPoint(x: 45.1, y: 18.93))
            bezierPath.addLine(to: CGPoint(x: 35.16, y: 30.46))
            bezierPath.addLine(to: CGPoint(x: 42.49, y: 39.01))
            bezierPath.addCurve(to: CGPoint(x: 50.12, y: 42.94), controlPoint1: CGPoint(x: 44.97, y: 41.93), controlPoint2: CGPoint(x: 46.94, y: 42.94))
            bezierPath.addLine(to: CGPoint(x: 55.58, y: 42.94))
            bezierPath.addLine(to: CGPoint(x: 55.58, y: 36.99))
            bezierPath.addCurve(to: CGPoint(x: 58.31, y: 34.29), controlPoint1: CGPoint(x: 55.58, y: 35.33), controlPoint2: CGPoint(x: 56.63, y: 34.29))
            bezierPath.addCurve(to: CGPoint(x: 60.4, y: 35.06), controlPoint1: CGPoint(x: 59.05, y: 34.29), controlPoint2: CGPoint(x: 59.81, y: 34.57))
            bezierPath.addLine(to: CGPoint(x: 71.99, y: 44.69))
            bezierPath.addCurve(to: CGPoint(x: 71.99, y: 48.79), controlPoint1: CGPoint(x: 73.37, y: 45.82), controlPoint2: CGPoint(x: 73.37, y: 47.66))
            bezierPath.addLine(to: CGPoint(x: 60.4, y: 58.36))
            bezierPath.addCurve(to: CGPoint(x: 58.31, y: 59.13), controlPoint1: CGPoint(x: 59.81, y: 58.85), controlPoint2: CGPoint(x: 59.05, y: 59.13))
            bezierPath.addCurve(to: CGPoint(x: 55.58, y: 56.43), controlPoint1: CGPoint(x: 56.63, y: 59.13), controlPoint2: CGPoint(x: 55.58, y: 58.09))
            bezierPath.addLine(to: CGPoint(x: 55.58, y: 49.62))
            bezierPath.addLine(to: CGPoint(x: 49.94, y: 49.62))
            bezierPath.addCurve(to: CGPoint(x: 37.9, y: 43.91), controlPoint1: CGPoint(x: 44.73, y: 49.62), controlPoint2: CGPoint(x: 41.56, y: 48.13))
            bezierPath.addLine(to: CGPoint(x: 30.74, y: 35.58))
            bezierPath.addLine(to: CGPoint(x: 23.88, y: 43.61))
            bezierPath.addCurve(to: CGPoint(x: 11.58, y: 49.59), controlPoint1: CGPoint(x: 20.04, y: 48.06), controlPoint2: CGPoint(x: 16.88, y: 49.59))
            bezierPath.addLine(to: CGPoint(x: 4.62, y: 49.59))
            bezierPath.addCurve(to: CGPoint(x: 1, y: 46.28), controlPoint1: CGPoint(x: 2.44, y: 49.59), controlPoint2: CGPoint(x: 1, y: 48.24))
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
