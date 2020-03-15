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

public class SPAlertIconBoltView: UIView {
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        BoltDraw.draw(frame: rect, resizing: .aspectFit, fillColor: self.tintColor)
    }
    
    class BoltDraw: NSObject {
        
        @objc dynamic public class func draw(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 60, height: 56), resizing: ResizingBehavior = .aspectFit, fillColor: UIColor = UIColor(red: 0.349, green: 0.345, blue: 0.353, alpha: 1.000)) {
            let context = UIGraphicsGetCurrentContext()!
            context.saveGState()
            let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 47, height: 71), target: targetFrame)
            context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
            context.scaleBy(x: resizedFrame.width / 47, y: resizedFrame.height / 71)
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 4.16, y: 42.19))
            bezierPath.addCurve(to: CGPoint(x: 2, y: 40.16), controlPoint1: CGPoint(x: 2.9, y: 42.19), controlPoint2: CGPoint(x: 2, y: 41.33))
            bezierPath.addCurve(to: CGPoint(x: 2.81, y: 38.24), controlPoint1: CGPoint(x: 2, y: 39.5), controlPoint2: CGPoint(x: 2.3, y: 38.9))
            bezierPath.addLine(to: CGPoint(x: 30, y: 4.25))
            bezierPath.addCurve(to: CGPoint(x: 34.07, y: 6.44), controlPoint1: CGPoint(x: 32.04, y: 1.71), controlPoint2: CGPoint(x: 35.21, y: 3.35))
            bezierPath.addLine(to: CGPoint(x: 25.12, y: 30.69))
            bezierPath.addLine(to: CGPoint(x: 42.07, y: 30.69))
            bezierPath.addCurve(to: CGPoint(x: 44.2, y: 32.73), controlPoint1: CGPoint(x: 43.33, y: 30.69), controlPoint2: CGPoint(x: 44.2, y: 31.59))
            bezierPath.addCurve(to: CGPoint(x: 43.42, y: 34.65), controlPoint1: CGPoint(x: 44.2, y: 33.42), controlPoint2: CGPoint(x: 43.93, y: 34.02))
            bezierPath.addLine(to: CGPoint(x: 16.23, y: 68.67))
            bezierPath.addCurve(to: CGPoint(x: 12.15, y: 66.45), controlPoint1: CGPoint(x: 14.19, y: 71.18), controlPoint2: CGPoint(x: 10.98, y: 69.54))
            bezierPath.addLine(to: CGPoint(x: 21.11, y: 42.19))
            bezierPath.addLine(to: CGPoint(x: 4.16, y: 42.19))
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
