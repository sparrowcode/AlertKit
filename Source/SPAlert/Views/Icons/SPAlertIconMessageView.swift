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

public class SPAlertIconMessageView: UIView {
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        MessageDraw.draw(frame: rect, resizing: .aspectFit, fillColor: self.tintColor)
    }
    
    class MessageDraw: NSObject {
        
        @objc dynamic public class func draw(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 60, height: 56), resizing: ResizingBehavior = .aspectFit, fillColor: UIColor = UIColor(red: 0.349, green: 0.345, blue: 0.353, alpha: 1.000)) {
            let context = UIGraphicsGetCurrentContext()!
            context.saveGState()
            let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 60, height: 56), target: targetFrame)
            context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
            context.scaleBy(x: resizedFrame.width / 60, y: resizedFrame.height / 56)
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 17.07, y: 54.63))
            bezierPath.addCurve(to: CGPoint(x: 19.56, y: 53.4), controlPoint1: CGPoint(x: 17.93, y: 54.63), controlPoint2: CGPoint(x: 18.6, y: 54.24))
            bezierPath.addLine(to: CGPoint(x: 29.14, y: 44.64))
            bezierPath.addLine(to: CGPoint(x: 46.29, y: 44.66))
            bezierPath.addCurve(to: CGPoint(x: 57.9, y: 33.05), controlPoint1: CGPoint(x: 53.85, y: 44.69), controlPoint2: CGPoint(x: 57.9, y: 40.48))
            bezierPath.addLine(to: CGPoint(x: 57.9, y: 13.62))
            bezierPath.addCurve(to: CGPoint(x: 46.29, y: 2), controlPoint1: CGPoint(x: 57.9, y: 6.19), controlPoint2: CGPoint(x: 53.85, y: 2))
            bezierPath.addLine(to: CGPoint(x: 13.62, y: 2))
            bezierPath.addCurve(to: CGPoint(x: 2, y: 13.62), controlPoint1: CGPoint(x: 6.06, y: 2), controlPoint2: CGPoint(x: 2, y: 6.16))
            bezierPath.addLine(to: CGPoint(x: 2, y: 33.05))
            bezierPath.addCurve(to: CGPoint(x: 13.62, y: 44.64), controlPoint1: CGPoint(x: 2, y: 40.5), controlPoint2: CGPoint(x: 6.06, y: 44.66))
            bezierPath.addLine(to: CGPoint(x: 14.81, y: 44.64))
            bezierPath.addLine(to: CGPoint(x: 14.81, y: 52.02))
            bezierPath.addCurve(to: CGPoint(x: 17.07, y: 54.63), controlPoint1: CGPoint(x: 14.81, y: 53.59), controlPoint2: CGPoint(x: 15.62, y: 54.63))
            bezierPath.close()
            bezierPath.move(to: CGPoint(x: 15.75, y: 16.2))
            bezierPath.addCurve(to: CGPoint(x: 14.12, y: 14.56), controlPoint1: CGPoint(x: 14.86, y: 16.2), controlPoint2: CGPoint(x: 14.12, y: 15.49))
            bezierPath.addCurve(to: CGPoint(x: 15.75, y: 12.98), controlPoint1: CGPoint(x: 14.12, y: 13.72), controlPoint2: CGPoint(x: 14.86, y: 12.98))
            bezierPath.addLine(to: CGPoint(x: 44.16, y: 12.98))
            bezierPath.addCurve(to: CGPoint(x: 45.78, y: 14.56), controlPoint1: CGPoint(x: 45.04, y: 12.98), controlPoint2: CGPoint(x: 45.78, y: 13.72))
            bezierPath.addCurve(to: CGPoint(x: 44.16, y: 16.2), controlPoint1: CGPoint(x: 45.78, y: 15.49), controlPoint2: CGPoint(x: 45.04, y: 16.2))
            bezierPath.addLine(to: CGPoint(x: 15.75, y: 16.2))
            bezierPath.close()
            bezierPath.move(to: CGPoint(x: 15.75, y: 25.29))
            bezierPath.addCurve(to: CGPoint(x: 14.12, y: 23.66), controlPoint1: CGPoint(x: 14.86, y: 25.29), controlPoint2: CGPoint(x: 14.12, y: 24.58))
            bezierPath.addCurve(to: CGPoint(x: 15.75, y: 22.06), controlPoint1: CGPoint(x: 14.12, y: 22.8), controlPoint2: CGPoint(x: 14.86, y: 22.06))
            bezierPath.addLine(to: CGPoint(x: 44.16, y: 22.06))
            bezierPath.addCurve(to: CGPoint(x: 45.78, y: 23.66), controlPoint1: CGPoint(x: 45.04, y: 22.06), controlPoint2: CGPoint(x: 45.78, y: 22.8))
            bezierPath.addCurve(to: CGPoint(x: 44.16, y: 25.29), controlPoint1: CGPoint(x: 45.78, y: 24.58), controlPoint2: CGPoint(x: 45.04, y: 25.29))
            bezierPath.addLine(to: CGPoint(x: 15.75, y: 25.29))
            bezierPath.close()
            bezierPath.move(to: CGPoint(x: 15.75, y: 34.39))
            bezierPath.addCurve(to: CGPoint(x: 14.12, y: 32.77), controlPoint1: CGPoint(x: 14.86, y: 34.39), controlPoint2: CGPoint(x: 14.12, y: 33.66))
            bezierPath.addCurve(to: CGPoint(x: 15.75, y: 31.14), controlPoint1: CGPoint(x: 14.12, y: 31.83), controlPoint2: CGPoint(x: 14.86, y: 31.14))
            bezierPath.addLine(to: CGPoint(x: 34.24, y: 31.14))
            bezierPath.addCurve(to: CGPoint(x: 35.84, y: 32.77), controlPoint1: CGPoint(x: 35.1, y: 31.14), controlPoint2: CGPoint(x: 35.84, y: 31.83))
            bezierPath.addCurve(to: CGPoint(x: 34.24, y: 34.39), controlPoint1: CGPoint(x: 35.84, y: 33.66), controlPoint2: CGPoint(x: 35.1, y: 34.39))
            bezierPath.addLine(to: CGPoint(x: 15.75, y: 34.39))
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
