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

public class SPAlertIconPrivacyView: UIView {
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        PrivacyDraw.draw(frame: rect, resizing: .aspectFit, fillColor: self.tintColor)
    }
    
    class PrivacyDraw: NSObject {
        
        @objc dynamic public class func draw(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 60, height: 56), resizing: ResizingBehavior = .aspectFit, fillColor: UIColor = UIColor(red: 0.349, green: 0.345, blue: 0.353, alpha: 1.000)) {
            let context = UIGraphicsGetCurrentContext()!
            context.saveGState()
            let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 55, height: 70), target: targetFrame)
            context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
            context.scaleBy(x: resizedFrame.width / 55, y: resizedFrame.height / 70)
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 5, y: 45.54))
            bezierPath.addLine(to: CGPoint(x: 5, y: 18.3))
            bezierPath.addCurve(to: CGPoint(x: 7.99, y: 15.34), controlPoint1: CGPoint(x: 5, y: 16.74), controlPoint2: CGPoint(x: 5.97, y: 15.34))
            bezierPath.addCurve(to: CGPoint(x: 10.86, y: 18.3), controlPoint1: CGPoint(x: 9.95, y: 15.34), controlPoint2: CGPoint(x: 10.86, y: 16.74))
            bezierPath.addLine(to: CGPoint(x: 10.86, y: 36.7))
            bezierPath.addCurve(to: CGPoint(x: 14.05, y: 35.05), controlPoint1: CGPoint(x: 11.83, y: 36.08), controlPoint2: CGPoint(x: 12.91, y: 35.52))
            bezierPath.addLine(to: CGPoint(x: 14.05, y: 9.19))
            bezierPath.addCurve(to: CGPoint(x: 16.98, y: 6.23), controlPoint1: CGPoint(x: 14.05, y: 7.63), controlPoint2: CGPoint(x: 15.05, y: 6.23))
            bezierPath.addCurve(to: CGPoint(x: 19.91, y: 9.19), controlPoint1: CGPoint(x: 18.92, y: 6.23), controlPoint2: CGPoint(x: 19.91, y: 7.63))
            bezierPath.addLine(to: CGPoint(x: 19.91, y: 33.41))
            bezierPath.addCurve(to: CGPoint(x: 23.11, y: 33.06), controlPoint1: CGPoint(x: 20.97, y: 33.24), controlPoint2: CGPoint(x: 22.02, y: 33.12))
            bezierPath.addLine(to: CGPoint(x: 23.11, y: 6.93))
            bezierPath.addCurve(to: CGPoint(x: 26.04, y: 4), controlPoint1: CGPoint(x: 23.11, y: 5.38), controlPoint2: CGPoint(x: 24.07, y: 4))
            bezierPath.addCurve(to: CGPoint(x: 28.96, y: 6.93), controlPoint1: CGPoint(x: 28, y: 4), controlPoint2: CGPoint(x: 28.96, y: 5.38))
            bezierPath.addLine(to: CGPoint(x: 28.96, y: 33.27))
            bezierPath.addCurve(to: CGPoint(x: 32.16, y: 33.91), controlPoint1: CGPoint(x: 30.14, y: 33.41), controlPoint2: CGPoint(x: 31.22, y: 33.65))
            bezierPath.addLine(to: CGPoint(x: 32.16, y: 10.77))
            bezierPath.addCurve(to: CGPoint(x: 35.09, y: 7.81), controlPoint1: CGPoint(x: 32.16, y: 9.21), controlPoint2: CGPoint(x: 33.12, y: 7.81))
            bezierPath.addCurve(to: CGPoint(x: 38.02, y: 10.77), controlPoint1: CGPoint(x: 37.08, y: 7.81), controlPoint2: CGPoint(x: 38.02, y: 9.21))
            bezierPath.addLine(to: CGPoint(x: 38.02, y: 39.04))
            bezierPath.addCurve(to: CGPoint(x: 39.25, y: 43.73), controlPoint1: CGPoint(x: 38.02, y: 42.09), controlPoint2: CGPoint(x: 38.34, y: 43.73))
            bezierPath.addCurve(to: CGPoint(x: 44.46, y: 33.74), controlPoint1: CGPoint(x: 40.83, y: 43.73), controlPoint2: CGPoint(x: 42.82, y: 37.22))
            bezierPath.addCurve(to: CGPoint(x: 49.41, y: 29.43), controlPoint1: CGPoint(x: 45.93, y: 30.57), controlPoint2: CGPoint(x: 46.89, y: 29.43))
            bezierPath.addCurve(to: CGPoint(x: 52.2, y: 31.8), controlPoint1: CGPoint(x: 50.53, y: 29.43), controlPoint2: CGPoint(x: 52.2, y: 30.54))
            bezierPath.addCurve(to: CGPoint(x: 49.65, y: 40.39), controlPoint1: CGPoint(x: 52.2, y: 33.77), controlPoint2: CGPoint(x: 50.56, y: 37.46))
            bezierPath.addLine(to: CGPoint(x: 49.52, y: 40.81))
            bezierPath.addCurve(to: CGPoint(x: 40.74, y: 59.66), controlPoint1: CGPoint(x: 48.39, y: 44.73), controlPoint2: CGPoint(x: 46.39, y: 53.71))
            bezierPath.addCurve(to: CGPoint(x: 24.16, y: 66.46), controlPoint1: CGPoint(x: 36.52, y: 64.12), controlPoint2: CGPoint(x: 31.25, y: 66.46))
            bezierPath.addCurve(to: CGPoint(x: 5, y: 45.54), controlPoint1: CGPoint(x: 13, y: 66.46), controlPoint2: CGPoint(x: 5, y: 59.99))
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
