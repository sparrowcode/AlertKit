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

public class SPAlertIconDislikeView: UIView {
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        DislikeDraw.draw(frame: rect, resizing: .aspectFit, fillColor: self.tintColor)
    }
    
    class DislikeDraw: NSObject {
        
        @objc dynamic public class func draw(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 60, height: 56), resizing: ResizingBehavior = .aspectFit, fillColor: UIColor = UIColor(red: 0.349, green: 0.345, blue: 0.353, alpha: 1.000)) {
            let context = UIGraphicsGetCurrentContext()!
            context.saveGState()
            let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 61, height: 64), target: targetFrame)
            context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
            context.scaleBy(x: resizedFrame.width / 61, y: resizedFrame.height / 64)
            context.saveGState()
            context.beginTransparencyLayer(auxiliaryInfo: nil)
            let clipPath = UIBezierPath()
            clipPath.move(to: CGPoint(x: 11.03, y: 4.6))
            clipPath.addLine(to: CGPoint(x: 10.83, y: 4.64))
            clipPath.addCurve(to: CGPoint(x: 6.47, y: 9.26), controlPoint1: CGPoint(x: 8.65, y: 5.18), controlPoint2: CGPoint(x: 6.47, y: 6.57))
            clipPath.addCurve(to: CGPoint(x: 7.14, y: 11.74), controlPoint1: CGPoint(x: 6.47, y: 10.35), controlPoint2: CGPoint(x: 6.75, y: 11.13))
            clipPath.addCurve(to: CGPoint(x: 7.08, y: 12.49), controlPoint1: CGPoint(x: 7.35, y: 12.08), controlPoint2: CGPoint(x: 7.34, y: 12.34))
            clipPath.addLine(to: CGPoint(x: 7, y: 12.53))
            clipPath.addCurve(to: CGPoint(x: 3.76, y: 17.14), controlPoint1: CGPoint(x: 5.24, y: 13.31), controlPoint2: CGPoint(x: 3.76, y: 14.9))
            clipPath.addCurve(to: CGPoint(x: 4.61, y: 20.17), controlPoint1: CGPoint(x: 3.76, y: 18.33), controlPoint2: CGPoint(x: 4.07, y: 19.38))
            clipPath.addLine(to: CGPoint(x: 4.74, y: 20.35))
            clipPath.addCurve(to: CGPoint(x: 4.52, y: 21.42), controlPoint1: CGPoint(x: 5.07, y: 20.77), controlPoint2: CGPoint(x: 4.99, y: 21.14))
            clipPath.addCurve(to: CGPoint(x: 2.36, y: 25.61), controlPoint1: CGPoint(x: 3.2, y: 22.14), controlPoint2: CGPoint(x: 2.36, y: 23.76))
            clipPath.addCurve(to: CGPoint(x: 3.42, y: 28.88), controlPoint1: CGPoint(x: 2.36, y: 26.84), controlPoint2: CGPoint(x: 2.73, y: 28.14))
            clipPath.addLine(to: CGPoint(x: 3.57, y: 29.02))
            clipPath.addCurve(to: CGPoint(x: 3.52, y: 30), controlPoint1: CGPoint(x: 3.96, y: 29.38), controlPoint2: CGPoint(x: 3.91, y: 29.65))
            clipPath.addLine(to: CGPoint(x: 3.43, y: 30.08))
            clipPath.addCurve(to: CGPoint(x: 2, y: 33.71), controlPoint1: CGPoint(x: 2.5, y: 30.78), controlPoint2: CGPoint(x: 2, y: 32.12))
            clipPath.addCurve(to: CGPoint(x: 6.89, y: 38.69), controlPoint1: CGPoint(x: 2, y: 36.45), controlPoint2: CGPoint(x: 4.12, y: 38.69))
            clipPath.addLine(to: CGPoint(x: 16.87, y: 38.69))
            clipPath.addCurve(to: CGPoint(x: 21.09, y: 42.07), controlPoint1: CGPoint(x: 19.41, y: 38.69), controlPoint2: CGPoint(x: 21.09, y: 39.97))
            clipPath.addCurve(to: CGPoint(x: 16.34, y: 57.86), controlPoint1: CGPoint(x: 21.09, y: 45.9), controlPoint2: CGPoint(x: 16.34, y: 52.83))
            clipPath.addCurve(to: CGPoint(x: 20.25, y: 62), controlPoint1: CGPoint(x: 16.34, y: 60.46), controlPoint2: CGPoint(x: 18.04, y: 62))
            clipPath.addCurve(to: CGPoint(x: 24.39, y: 58.48), controlPoint1: CGPoint(x: 22.26, y: 62), controlPoint2: CGPoint(x: 23.3, y: 60.6))
            clipPath.addCurve(to: CGPoint(x: 38.48, y: 37.96), controlPoint1: CGPoint(x: 28.53, y: 50.26), controlPoint2: CGPoint(x: 34.17, y: 43.66))
            clipPath.addCurve(to: CGPoint(x: 43.98, y: 22.34), controlPoint1: CGPoint(x: 42.11, y: 33.13), controlPoint2: CGPoint(x: 43.9, y: 29.02))
            clipPath.addCurve(to: CGPoint(x: 23.02, y: 4.06), controlPoint1: CGPoint(x: 44.12, y: 12.1), controlPoint2: CGPoint(x: 35.93, y: 4.3))
            clipPath.addLine(to: CGPoint(x: 18.74, y: 4))
            clipPath.addCurve(to: CGPoint(x: 11.03, y: 4.6), controlPoint1: CGPoint(x: 15.23, y: 3.98), controlPoint2: CGPoint(x: 12.61, y: 4.23))
            clipPath.addLine(to: CGPoint(x: 11.03, y: 4.6))
            clipPath.close()
            clipPath.move(to: CGPoint(x: 57.73, y: 22.11))
            clipPath.addCurve(to: CGPoint(x: 46.55, y: 37.63), controlPoint1: CGPoint(x: 57.73, y: 30.83), controlPoint2: CGPoint(x: 52.87, y: 37.63))
            clipPath.addLine(to: CGPoint(x: 42.44, y: 37.63))
            clipPath.addCurve(to: CGPoint(x: 47.78, y: 22.39), controlPoint1: CGPoint(x: 44.93, y: 34.55), controlPoint2: CGPoint(x: 47.67, y: 29.49))
            clipPath.addCurve(to: CGPoint(x: 40.52, y: 6.71), controlPoint1: CGPoint(x: 47.9, y: 16.02), controlPoint2: CGPoint(x: 45.58, y: 10.43))
            clipPath.addLine(to: CGPoint(x: 45.52, y: 6.71))
            clipPath.addCurve(to: CGPoint(x: 57.73, y: 22.11), controlPoint1: CGPoint(x: 52.51, y: 6.71), controlPoint2: CGPoint(x: 57.73, y: 13.73))
            clipPath.close()
            clipPath.addClip()
            let rectanglePath = UIBezierPath(rect: CGRect(x: -3.02, y: -1, width: 65.75, height: 68))
            fillColor.setFill()
            rectanglePath.fill()
            context.endTransparencyLayer()
            context.restoreGState()
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
