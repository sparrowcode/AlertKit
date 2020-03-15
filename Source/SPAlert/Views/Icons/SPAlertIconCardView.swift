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

public class SPAlertIconCardView: UIView {
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        CardDraw.draw(frame: rect, resizing: .aspectFit, fillColor: self.tintColor)
    }
    
    class CardDraw: NSObject {
        
        @objc dynamic public class func draw(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 60, height: 56), resizing: ResizingBehavior = .aspectFit, fillColor: UIColor = UIColor(red: 0.349, green: 0.345, blue: 0.353, alpha: 1.000)) {
            let context = UIGraphicsGetCurrentContext()!
            context.saveGState()
            let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 67, height: 59), target: targetFrame)
            context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
            context.scaleBy(x: resizedFrame.width / 67, y: resizedFrame.height / 59)
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 3, y: 18.02))
            bezierPath.addLine(to: CGPoint(x: 63.06, y: 18.02))
            bezierPath.addLine(to: CGPoint(x: 63.06, y: 15.48))
            bezierPath.addCurve(to: CGPoint(x: 54.47, y: 7), controlPoint1: CGPoint(x: 63.06, y: 9.84), controlPoint2: CGPoint(x: 60.19, y: 7))
            bezierPath.addLine(to: CGPoint(x: 11.59, y: 7))
            bezierPath.addCurve(to: CGPoint(x: 3, y: 15.48), controlPoint1: CGPoint(x: 5.84, y: 7), controlPoint2: CGPoint(x: 3, y: 9.84))
            bezierPath.addLine(to: CGPoint(x: 3, y: 18.02))
            bezierPath.close()
            bezierPath.move(to: CGPoint(x: 3, y: 44.55))
            bezierPath.addCurve(to: CGPoint(x: 11.59, y: 53), controlPoint1: CGPoint(x: 3, y: 50.18), controlPoint2: CGPoint(x: 5.84, y: 53))
            bezierPath.addLine(to: CGPoint(x: 54.47, y: 53))
            bezierPath.addCurve(to: CGPoint(x: 63.06, y: 44.55), controlPoint1: CGPoint(x: 60.19, y: 53), controlPoint2: CGPoint(x: 63.06, y: 50.18))
            bezierPath.addLine(to: CGPoint(x: 63.06, y: 24.23))
            bezierPath.addLine(to: CGPoint(x: 3, y: 24.23))
            bezierPath.addLine(to: CGPoint(x: 3, y: 44.55))
            bezierPath.close()
            bezierPath.move(to: CGPoint(x: 12.13, y: 37.88))
            bezierPath.addLine(to: CGPoint(x: 12.13, y: 32.82))
            bezierPath.addCurve(to: CGPoint(x: 14.81, y: 30.19), controlPoint1: CGPoint(x: 12.13, y: 31.29), controlPoint2: CGPoint(x: 13.2, y: 30.19))
            bezierPath.addLine(to: CGPoint(x: 21.51, y: 30.19))
            bezierPath.addCurve(to: CGPoint(x: 24.2, y: 32.82), controlPoint1: CGPoint(x: 23.13, y: 30.19), controlPoint2: CGPoint(x: 24.2, y: 31.29))
            bezierPath.addLine(to: CGPoint(x: 24.2, y: 37.88))
            bezierPath.addCurve(to: CGPoint(x: 21.51, y: 40.5), controlPoint1: CGPoint(x: 24.2, y: 39.44), controlPoint2: CGPoint(x: 23.13, y: 40.5))
            bezierPath.addLine(to: CGPoint(x: 14.81, y: 40.5))
            bezierPath.addCurve(to: CGPoint(x: 12.13, y: 37.88), controlPoint1: CGPoint(x: 13.2, y: 40.5), controlPoint2: CGPoint(x: 12.13, y: 39.44))
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
