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

public class SPAlertIconMoonView: UIView {
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        MoonDraw.draw(frame: rect, resizing: .aspectFit, fillColor: self.tintColor)
    }
    
    class MoonDraw: NSObject {
        
        @objc dynamic public class func draw(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 53, height: 52), resizing: ResizingBehavior = .aspectFit, fillColor: UIColor = UIColor(red: 0.349, green: 0.345, blue: 0.353, alpha: 1.000)) {
            let context = UIGraphicsGetCurrentContext()!
            context.saveGState()
            let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 53, height: 52), target: targetFrame)
            context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
            context.scaleBy(x: resizedFrame.width / 53, y: resizedFrame.height / 52)
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 40.82, y: 34.76))
            bezierPath.addCurve(to: CGPoint(x: 48.45, y: 33.58), controlPoint1: CGPoint(x: 43.67, y: 34.76), controlPoint2: CGPoint(x: 46.55, y: 34.16))
            bezierPath.addLine(to: CGPoint(x: 48.74, y: 33.49))
            bezierPath.addCurve(to: CGPoint(x: 49.79, y: 33.27), controlPoint1: CGPoint(x: 49.2, y: 33.34), controlPoint2: CGPoint(x: 49.47, y: 33.27))
            bezierPath.addCurve(to: CGPoint(x: 51.23, y: 34.78), controlPoint1: CGPoint(x: 50.47, y: 33.27), controlPoint2: CGPoint(x: 51.23, y: 33.88))
            bezierPath.addLine(to: CGPoint(x: 51.22, y: 34.95))
            bezierPath.addCurve(to: CGPoint(x: 50.96, y: 36.15), controlPoint1: CGPoint(x: 51.2, y: 35.24), controlPoint2: CGPoint(x: 51.14, y: 35.7))
            bezierPath.addCurve(to: CGPoint(x: 28.28, y: 50.5), controlPoint1: CGPoint(x: 47.93, y: 44.12), controlPoint2: CGPoint(x: 38.81, y: 50.5))
            bezierPath.addCurve(to: CGPoint(x: 3, y: 25.86), controlPoint1: CGPoint(x: 13.95, y: 50.5), controlPoint2: CGPoint(x: 3, y: 40.23))
            bezierPath.addCurve(to: CGPoint(x: 18.11, y: 2.27), controlPoint1: CGPoint(x: 3, y: 15.62), controlPoint2: CGPoint(x: 9.06, y: 5.89))
            bezierPath.addCurve(to: CGPoint(x: 19.5, y: 2), controlPoint1: CGPoint(x: 18.65, y: 2.07), controlPoint2: CGPoint(x: 19.23, y: 2))
            bezierPath.addCurve(to: CGPoint(x: 20.94, y: 3.39), controlPoint1: CGPoint(x: 20.45, y: 2), controlPoint2: CGPoint(x: 20.94, y: 2.73))
            bezierPath.addCurve(to: CGPoint(x: 20.67, y: 4.54), controlPoint1: CGPoint(x: 20.94, y: 3.64), controlPoint2: CGPoint(x: 20.89, y: 3.98))
            bezierPath.addCurve(to: CGPoint(x: 19.13, y: 13.22), controlPoint1: CGPoint(x: 19.79, y: 6.57), controlPoint2: CGPoint(x: 19.13, y: 10.48))
            bezierPath.addCurve(to: CGPoint(x: 40.82, y: 34.76), controlPoint1: CGPoint(x: 19.13, y: 26.47), controlPoint2: CGPoint(x: 27.59, y: 34.76))
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
