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

public class SPAlertIconRotateView: UIView {
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        RotateDraw.draw(frame: rect, resizing: .aspectFit, fillColor: self.tintColor)
    }
    
    class RotateDraw: NSObject {
        
        @objc dynamic public class func draw(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 60, height: 56), resizing: ResizingBehavior = .aspectFit, fillColor: UIColor = UIColor(red: 0.349, green: 0.345, blue: 0.353, alpha: 1.000)) {
            let context = UIGraphicsGetCurrentContext()!
            context.saveGState()
            let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 62, height: 71), target: targetFrame)
            context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
            context.scaleBy(x: resizedFrame.width / 62, y: resizedFrame.height / 71)
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 7.69, y: 32.39))
            bezierPath.addCurve(to: CGPoint(x: 8.52, y: 30.88), controlPoint1: CGPoint(x: 8.28, y: 32.09), controlPoint2: CGPoint(x: 8.58, y: 31.63))
            bezierPath.addCurve(to: CGPoint(x: 7.37, y: 24.98), controlPoint1: CGPoint(x: 8.47, y: 29.91), controlPoint2: CGPoint(x: 7.37, y: 28.56))
            bezierPath.addCurve(to: CGPoint(x: 16.61, y: 15.16), controlPoint1: CGPoint(x: 7.37, y: 19.31), controlPoint2: CGPoint(x: 10.94, y: 15.29))
            bezierPath.addLine(to: CGPoint(x: 16.95, y: 15.15))
            bezierPath.addLine(to: CGPoint(x: 16.95, y: 18.87))
            bezierPath.addCurve(to: CGPoint(x: 20.11, y: 20.37), controlPoint1: CGPoint(x: 16.95, y: 20.94), controlPoint2: CGPoint(x: 18.56, y: 21.45))
            bezierPath.addLine(to: CGPoint(x: 27.62, y: 14.91))
            bezierPath.addCurve(to: CGPoint(x: 27.62, y: 12.06), controlPoint1: CGPoint(x: 28.83, y: 14.02), controlPoint2: CGPoint(x: 28.83, y: 12.97))
            bezierPath.addLine(to: CGPoint(x: 20.24, y: 6.67))
            bezierPath.addCurve(to: CGPoint(x: 16.95, y: 8.1), controlPoint1: CGPoint(x: 18.62, y: 5.43), controlPoint2: CGPoint(x: 16.95, y: 5.91))
            bezierPath.addLine(to: CGPoint(x: 16.95, y: 12.06))
            bezierPath.addLine(to: CGPoint(x: 16.87, y: 12.06))
            bezierPath.addCurve(to: CGPoint(x: 4, y: 24.96), controlPoint1: CGPoint(x: 9.14, y: 12.06), controlPoint2: CGPoint(x: 4, y: 17.25))
            bezierPath.addCurve(to: CGPoint(x: 5.4, y: 31.63), controlPoint1: CGPoint(x: 4, y: 27.84), controlPoint2: CGPoint(x: 4.59, y: 30.21))
            bezierPath.addCurve(to: CGPoint(x: 7.69, y: 32.39), controlPoint1: CGPoint(x: 5.89, y: 32.42), controlPoint2: CGPoint(x: 6.85, y: 32.79))
            bezierPath.close()
            bezierPath.move(to: CGPoint(x: 51.05, y: 66))
            bezierPath.addLine(to: CGPoint(x: 24.33, y: 66))
            bezierPath.addCurve(to: CGPoint(x: 17.44, y: 59.08), controlPoint1: CGPoint(x: 19.73, y: 66), controlPoint2: CGPoint(x: 17.44, y: 63.79))
            bezierPath.addLine(to: CGPoint(x: 17.44, y: 32.44))
            bezierPath.addCurve(to: CGPoint(x: 24.33, y: 25.52), controlPoint1: CGPoint(x: 17.44, y: 27.73), controlPoint2: CGPoint(x: 19.73, y: 25.52))
            bezierPath.addLine(to: CGPoint(x: 51.05, y: 25.52))
            bezierPath.addCurve(to: CGPoint(x: 57.94, y: 32.44), controlPoint1: CGPoint(x: 55.66, y: 25.52), controlPoint2: CGPoint(x: 57.94, y: 27.73))
            bezierPath.addLine(to: CGPoint(x: 57.94, y: 59.08))
            bezierPath.addCurve(to: CGPoint(x: 51.05, y: 66), controlPoint1: CGPoint(x: 57.94, y: 63.79), controlPoint2: CGPoint(x: 55.66, y: 66))
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
