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

public class SPAlertIconDocView: UIView {
        
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        DocDraw.draw(frame: rect, resizing: .aspectFit, fillColor: self.tintColor)
    }
    
    class DocDraw: NSObject {
        
        @objc dynamic public class func draw(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 70, height: 87), resizing: ResizingBehavior = .aspectFit, fillColor: UIColor = UIColor(red: 0.349, green: 0.345, blue: 0.353, alpha: 1.000)) {
            let context = UIGraphicsGetCurrentContext()!
            context.saveGState()
            let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 70, height: 87), target: targetFrame)
            context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
            context.scaleBy(x: resizedFrame.width / 70, y: resizedFrame.height / 87)
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 13.73, y: 86.65))
            bezierPath.addLine(to: CGPoint(x: 55.38, y: 86.65))
            bezierPath.addCurve(to: CGPoint(x: 68.11, y: 73.76), controlPoint1: CGPoint(x: 63.77, y: 86.65), controlPoint2: CGPoint(x: 68.11, y: 82.2))
            bezierPath.addLine(to: CGPoint(x: 68.11, y: 38.84))
            bezierPath.addLine(to: CGPoint(x: 38.81, y: 38.84))
            bezierPath.addCurve(to: CGPoint(x: 31.59, y: 31.61), controlPoint1: CGPoint(x: 33.93, y: 38.84), controlPoint2: CGPoint(x: 31.59, y: 36.49))
            bezierPath.addLine(to: CGPoint(x: 31.59, y: 2))
            bezierPath.addLine(to: CGPoint(x: 13.73, y: 2))
            bezierPath.addCurve(to: CGPoint(x: 1, y: 14.85), controlPoint1: CGPoint(x: 5.38, y: 2), controlPoint2: CGPoint(x: 1, y: 6.41))
            bezierPath.addLine(to: CGPoint(x: 1, y: 73.76))
            bezierPath.addCurve(to: CGPoint(x: 13.73, y: 86.65), controlPoint1: CGPoint(x: 1, y: 82.23), controlPoint2: CGPoint(x: 5.38, y: 86.65))
            bezierPath.close()
            bezierPath.move(to: CGPoint(x: 39.55, y: 33.13))
            bezierPath.addCurve(to: CGPoint(x: 37.29, y: 30.87), controlPoint1: CGPoint(x: 38.07, y: 33.13), controlPoint2: CGPoint(x: 37.33, y: 32.39))
            bezierPath.addLine(to: CGPoint(x: 37.29, y: 2.39))
            bezierPath.addCurve(to: CGPoint(x: 42.8, y: 5.91), controlPoint1: CGPoint(x: 39.09, y: 2.62), controlPoint2: CGPoint(x: 40.84, y: 3.95))
            bezierPath.addLine(to: CGPoint(x: 64.16, y: 27.59))
            bezierPath.addLine(to: CGPoint(x: 64.68, y: 28.12))
            bezierPath.addCurve(to: CGPoint(x: 67.72, y: 33.13), controlPoint1: CGPoint(x: 66.41, y: 29.95), controlPoint2: CGPoint(x: 67.5, y: 31.49))
            bezierPath.addLine(to: CGPoint(x: 39.55, y: 33.13))
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

