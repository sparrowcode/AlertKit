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

public class SPAlertIconStarView: UIView {
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        StarDraw.draw(frame: rect, resizing: .aspectFit, fillColor: self.tintColor)
    }
    
    class StarDraw: NSObject {
        
        @objc dynamic public class func draw(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 65, height: 65), resizing: ResizingBehavior = .aspectFit, fillColor: UIColor = UIColor(red: 0.349, green: 0.345, blue: 0.353, alpha: 1.000)) {
            let context = UIGraphicsGetCurrentContext()!
            context.saveGState()
            let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 65, height: 65), target: targetFrame)
            context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
            context.scaleBy(x: resizedFrame.width / 65, y: resizedFrame.height / 65)
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 12.85, y: 61.49))
            bezierPath.addCurve(to: CGPoint(x: 12.06, y: 57.48), controlPoint1: CGPoint(x: 11.76, y: 60.67), controlPoint2: CGPoint(x: 11.48, y: 59.34))
            bezierPath.addLine(to: CGPoint(x: 17.96, y: 39.89))
            bezierPath.addLine(to: CGPoint(x: 3.12, y: 29.24))
            bezierPath.addCurve(to: CGPoint(x: 1.14, y: 25.35), controlPoint1: CGPoint(x: 1.39, y: 28.02), controlPoint2: CGPoint(x: 0.67, y: 26.71))
            bezierPath.addCurve(to: CGPoint(x: 5.03, y: 23.35), controlPoint1: CGPoint(x: 1.59, y: 23.99), controlPoint2: CGPoint(x: 2.89, y: 23.32))
            bezierPath.addLine(to: CGPoint(x: 23.24, y: 23.49))
            bezierPath.addLine(to: CGPoint(x: 28.77, y: 6.09))
            bezierPath.addCurve(to: CGPoint(x: 31.86, y: 3), controlPoint1: CGPoint(x: 29.44, y: 4.06), controlPoint2: CGPoint(x: 30.44, y: 3))
            bezierPath.addCurve(to: CGPoint(x: 34.97, y: 6.09), controlPoint1: CGPoint(x: 33.31, y: 3), controlPoint2: CGPoint(x: 34.31, y: 4.06))
            bezierPath.addLine(to: CGPoint(x: 40.51, y: 23.49))
            bezierPath.addLine(to: CGPoint(x: 58.71, y: 23.35))
            bezierPath.addCurve(to: CGPoint(x: 62.61, y: 25.35), controlPoint1: CGPoint(x: 60.85, y: 23.32), controlPoint2: CGPoint(x: 62.16, y: 23.99))
            bezierPath.addCurve(to: CGPoint(x: 60.63, y: 29.24), controlPoint1: CGPoint(x: 63.05, y: 26.71), controlPoint2: CGPoint(x: 62.36, y: 28.02))
            bezierPath.addLine(to: CGPoint(x: 45.79, y: 39.89))
            bezierPath.addLine(to: CGPoint(x: 51.6, y: 57.21))
            bezierPath.addCurve(to: CGPoint(x: 50.9, y: 61.49), controlPoint1: CGPoint(x: 52.29, y: 59.21), controlPoint2: CGPoint(x: 52.04, y: 60.63))
            bezierPath.addCurve(to: CGPoint(x: 46.59, y: 60.82), controlPoint1: CGPoint(x: 49.73, y: 62.38), controlPoint2: CGPoint(x: 48.32, y: 62.07))
            bezierPath.addLine(to: CGPoint(x: 31.86, y: 50.01))
            bezierPath.addLine(to: CGPoint(x: 17.15, y: 60.82))
            bezierPath.addCurve(to: CGPoint(x: 12.85, y: 61.49), controlPoint1: CGPoint(x: 15.43, y: 62.07), controlPoint2: CGPoint(x: 13.98, y: 62.38))
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
