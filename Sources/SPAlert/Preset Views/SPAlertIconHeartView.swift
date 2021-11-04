// The MIT License (MIT)
// Copyright © 2020 Ivan Vorobei (hello@ivanvorobei.by)
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

public class SPAlertIconHeartView: UIView {
        
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        HeartDraw.draw(frame: rect, resizing: .aspectFit, fillColor: self.tintColor)
    }
    
    class HeartDraw: NSObject {
        
        @objc dynamic public class func draw(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 510, height: 470), resizing: ResizingBehavior = .aspectFit, fillColor: UIColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)) {
            let context = UIGraphicsGetCurrentContext()!
            context.saveGState()
            let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 510, height: 470), target: targetFrame)
            context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
            context.scaleBy(x: resizedFrame.width / 510, y: resizedFrame.height / 470)
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 255, y: 469.6))
            bezierPath.addLine(to: CGPoint(x: 219.3, y: 433.9))
            bezierPath.addCurve(to: CGPoint(x: 0, y: 140.65), controlPoint1: CGPoint(x: 86.7, y: 316.6), controlPoint2: CGPoint(x: 0, y: 237.55))
            bezierPath.addCurve(to: CGPoint(x: 140.25, y: 0.4), controlPoint1: CGPoint(x: 0, y: 61.6), controlPoint2: CGPoint(x: 61.2, y: 0.4))
            bezierPath.addCurve(to: CGPoint(x: 255, y: 53.95), controlPoint1: CGPoint(x: 183.6, y: 0.4), controlPoint2: CGPoint(x: 226.95, y: 20.8))
            bezierPath.addCurve(to: CGPoint(x: 369.75, y: 0.4), controlPoint1: CGPoint(x: 283.05, y: 20.8), controlPoint2: CGPoint(x: 326.4, y: 0.4))
            bezierPath.addCurve(to: CGPoint(x: 510, y: 140.65), controlPoint1: CGPoint(x: 448.8, y: 0.4), controlPoint2: CGPoint(x: 510, y: 61.6))
            bezierPath.addCurve(to: CGPoint(x: 290.7, y: 433.9), controlPoint1: CGPoint(x: 510, y: 237.55), controlPoint2: CGPoint(x: 423.3, y: 316.6))
            bezierPath.addLine(to: CGPoint(x: 255, y: 469.6))
            bezierPath.close()
            fillColor.setFill()
            bezierPath.fill()
            context.restoreGState()
        }
        
        @objc(HeartStyleKitResizingBehavior)
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

