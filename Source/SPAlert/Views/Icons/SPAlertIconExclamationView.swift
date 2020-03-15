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

public class SPAlertIconExclamationView: UIView {
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        ExclamationDraw.draw(frame: rect, resizing: .aspectFit, fillColor: self.tintColor)
    }
    
    class ExclamationDraw: NSObject {
        
        @objc dynamic public class func draw(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 65, height: 65), resizing: ResizingBehavior = .aspectFit, fillColor: UIColor = UIColor(red: 0.349, green: 0.345, blue: 0.353, alpha: 1.000)) {
            let context = UIGraphicsGetCurrentContext()!
            context.saveGState()
            let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 58, height: 52), target: targetFrame)
            context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
            context.scaleBy(x: resizedFrame.width / 58, y: resizedFrame.height / 52)
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 9.05, y: 50))
            bezierPath.addLine(to: CGPoint(x: 48.02, y: 50))
            bezierPath.addCurve(to: CGPoint(x: 54.07, y: 43.95), controlPoint1: CGPoint(x: 51.74, y: 50), controlPoint2: CGPoint(x: 54.07, y: 47.32))
            bezierPath.addCurve(to: CGPoint(x: 53.27, y: 40.97), controlPoint1: CGPoint(x: 54.07, y: 42.93), controlPoint2: CGPoint(x: 53.82, y: 41.91))
            bezierPath.addLine(to: CGPoint(x: 33.75, y: 6.05))
            bezierPath.addCurve(to: CGPoint(x: 28.55, y: 3), controlPoint1: CGPoint(x: 32.64, y: 4.04), controlPoint2: CGPoint(x: 30.58, y: 3))
            bezierPath.addCurve(to: CGPoint(x: 23.31, y: 6.05), controlPoint1: CGPoint(x: 26.49, y: 3), controlPoint2: CGPoint(x: 24.43, y: 4.04))
            bezierPath.addLine(to: CGPoint(x: 3.82, y: 41))
            bezierPath.addCurve(to: CGPoint(x: 3, y: 43.95), controlPoint1: CGPoint(x: 3.27, y: 41.94), controlPoint2: CGPoint(x: 3, y: 42.93))
            bezierPath.addCurve(to: CGPoint(x: 9.05, y: 50), controlPoint1: CGPoint(x: 3, y: 47.32), controlPoint2: CGPoint(x: 5.33, y: 50))
            bezierPath.close()
            bezierPath.move(to: CGPoint(x: 28.55, y: 33.01))
            bezierPath.addCurve(to: CGPoint(x: 26.46, y: 30.93), controlPoint1: CGPoint(x: 27.23, y: 33.01), controlPoint2: CGPoint(x: 26.51, y: 32.27))
            bezierPath.addLine(to: CGPoint(x: 26.12, y: 18.67))
            bezierPath.addCurve(to: CGPoint(x: 28.52, y: 16.34), controlPoint1: CGPoint(x: 26.07, y: 17.34), controlPoint2: CGPoint(x: 27.11, y: 16.34))
            bezierPath.addCurve(to: CGPoint(x: 30.93, y: 18.7), controlPoint1: CGPoint(x: 29.91, y: 16.34), controlPoint2: CGPoint(x: 30.98, y: 17.36))
            bezierPath.addLine(to: CGPoint(x: 30.58, y: 30.93))
            bezierPath.addCurve(to: CGPoint(x: 28.55, y: 33.01), controlPoint1: CGPoint(x: 30.53, y: 32.29), controlPoint2: CGPoint(x: 29.79, y: 33.01))
            bezierPath.close()
            bezierPath.move(to: CGPoint(x: 28.55, y: 42.16))
            bezierPath.addCurve(to: CGPoint(x: 25.77, y: 39.48), controlPoint1: CGPoint(x: 27.11, y: 42.16), controlPoint2: CGPoint(x: 25.77, y: 41.02))
            bezierPath.addCurve(to: CGPoint(x: 28.55, y: 36.81), controlPoint1: CGPoint(x: 25.77, y: 37.95), controlPoint2: CGPoint(x: 27.08, y: 36.81))
            bezierPath.addCurve(to: CGPoint(x: 31.32, y: 39.48), controlPoint1: CGPoint(x: 29.98, y: 36.81), controlPoint2: CGPoint(x: 31.32, y: 37.92))
            bezierPath.addCurve(to: CGPoint(x: 28.55, y: 42.16), controlPoint1: CGPoint(x: 31.32, y: 41.05), controlPoint2: CGPoint(x: 29.96, y: 42.16))
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
