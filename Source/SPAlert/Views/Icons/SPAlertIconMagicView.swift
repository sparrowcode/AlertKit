// The MIT License (MIT)
// Copyright © 2019 Ivan Vorobei (ivanvorobei@icloud.com)
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

public class SPAlertIconMagicView: UIView {
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        MagicDraw.draw(frame: rect, resizing: .aspectFit, fillColor: self.tintColor)
    }
    
    class MagicDraw: NSObject {
        
        @objc dynamic public class func draw(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 60, height: 56), resizing: ResizingBehavior = .aspectFit, fillColor: UIColor = UIColor(red: 0.349, green: 0.345, blue: 0.353, alpha: 1.000)) {
            let context = UIGraphicsGetCurrentContext()!
            context.saveGState()
            let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 70, height: 71), target: targetFrame)
            context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
            context.scaleBy(x: resizedFrame.width / 70, y: resizedFrame.height / 71)
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 27.16, y: 20.43))
            bezierPath.addCurve(to: CGPoint(x: 27.74, y: 19.98), controlPoint1: CGPoint(x: 27.49, y: 20.43), controlPoint2: CGPoint(x: 27.67, y: 20.25))
            bezierPath.addLine(to: CGPoint(x: 28.06, y: 18.5))
            bezierPath.addCurve(to: CGPoint(x: 33.81, y: 13.83), controlPoint1: CGPoint(x: 28.84, y: 14.99), controlPoint2: CGPoint(x: 29.27, y: 14.75))
            bezierPath.addCurve(to: CGPoint(x: 34.39, y: 13.23), controlPoint1: CGPoint(x: 34.15, y: 13.77), controlPoint2: CGPoint(x: 34.39, y: 13.56))
            bezierPath.addCurve(to: CGPoint(x: 33.81, y: 12.59), controlPoint1: CGPoint(x: 34.39, y: 12.86), controlPoint2: CGPoint(x: 34.15, y: 12.65))
            bezierPath.addLine(to: CGPoint(x: 32.82, y: 12.39))
            bezierPath.addCurve(to: CGPoint(x: 28.06, y: 7.95), controlPoint1: CGPoint(x: 29.2, y: 11.61), controlPoint2: CGPoint(x: 28.78, y: 11.16))
            bezierPath.addLine(to: CGPoint(x: 27.77, y: 6.57))
            bezierPath.addCurve(to: CGPoint(x: 27.16, y: 6), controlPoint1: CGPoint(x: 27.71, y: 6.24), controlPoint2: CGPoint(x: 27.52, y: 6))
            bezierPath.addCurve(to: CGPoint(x: 26.58, y: 6.48), controlPoint1: CGPoint(x: 26.83, y: 6), controlPoint2: CGPoint(x: 26.65, y: 6.2))
            bezierPath.addLine(to: CGPoint(x: 26.26, y: 7.95))
            bezierPath.addCurve(to: CGPoint(x: 20.51, y: 12.59), controlPoint1: CGPoint(x: 25.48, y: 11.43), controlPoint2: CGPoint(x: 25.05, y: 11.67))
            bezierPath.addCurve(to: CGPoint(x: 19.93, y: 13.23), controlPoint1: CGPoint(x: 20.18, y: 12.65), controlPoint2: CGPoint(x: 19.93, y: 12.86))
            bezierPath.addCurve(to: CGPoint(x: 20.51, y: 13.83), controlPoint1: CGPoint(x: 19.93, y: 13.56), controlPoint2: CGPoint(x: 20.18, y: 13.77))
            bezierPath.addLine(to: CGPoint(x: 21.5, y: 14.04))
            bezierPath.addCurve(to: CGPoint(x: 26.26, y: 18.5), controlPoint1: CGPoint(x: 25.12, y: 14.81), controlPoint2: CGPoint(x: 25.54, y: 15.27))
            bezierPath.addLine(to: CGPoint(x: 26.56, y: 19.88))
            bezierPath.addCurve(to: CGPoint(x: 27.16, y: 20.43), controlPoint1: CGPoint(x: 26.62, y: 20.21), controlPoint2: CGPoint(x: 26.8, y: 20.43))
            bezierPath.close()
            bezierPath.move(to: CGPoint(x: 52.14, y: 31.1))
            bezierPath.addCurve(to: CGPoint(x: 52.9, y: 30.44), controlPoint1: CGPoint(x: 52.56, y: 31.1), controlPoint2: CGPoint(x: 52.81, y: 30.83))
            bezierPath.addLine(to: CGPoint(x: 53.17, y: 28.93))
            bezierPath.addCurve(to: CGPoint(x: 60.03, y: 23.27), controlPoint1: CGPoint(x: 53.99, y: 24.61), controlPoint2: CGPoint(x: 54.53, y: 24.23))
            bezierPath.addCurve(to: CGPoint(x: 60.73, y: 22.51), controlPoint1: CGPoint(x: 60.46, y: 23.21), controlPoint2: CGPoint(x: 60.73, y: 22.94))
            bezierPath.addCurve(to: CGPoint(x: 60.03, y: 21.76), controlPoint1: CGPoint(x: 60.73, y: 22.09), controlPoint2: CGPoint(x: 60.46, y: 21.85))
            bezierPath.addLine(to: CGPoint(x: 59.21, y: 21.61))
            bezierPath.addCurve(to: CGPoint(x: 52.9, y: 14.62), controlPoint1: CGPoint(x: 53.95, y: 20.68), controlPoint2: CGPoint(x: 53.88, y: 20.09))
            bezierPath.addCurve(to: CGPoint(x: 52.14, y: 13.92), controlPoint1: CGPoint(x: 52.81, y: 14.23), controlPoint2: CGPoint(x: 52.56, y: 13.92))
            bezierPath.addCurve(to: CGPoint(x: 51.38, y: 14.62), controlPoint1: CGPoint(x: 51.72, y: 13.92), controlPoint2: CGPoint(x: 51.48, y: 14.23))
            bezierPath.addLine(to: CGPoint(x: 51.11, y: 16.12))
            bezierPath.addCurve(to: CGPoint(x: 44.25, y: 21.76), controlPoint1: CGPoint(x: 50.3, y: 20.44), controlPoint2: CGPoint(x: 49.75, y: 20.83))
            bezierPath.addCurve(to: CGPoint(x: 43.55, y: 22.51), controlPoint1: CGPoint(x: 43.85, y: 21.85), controlPoint2: CGPoint(x: 43.55, y: 22.09))
            bezierPath.addCurve(to: CGPoint(x: 44.25, y: 23.27), controlPoint1: CGPoint(x: 43.55, y: 22.94), controlPoint2: CGPoint(x: 43.85, y: 23.21))
            bezierPath.addLine(to: CGPoint(x: 45.08, y: 23.42))
            bezierPath.addCurve(to: CGPoint(x: 51.38, y: 30.44), controlPoint1: CGPoint(x: 50.33, y: 24.37), controlPoint2: CGPoint(x: 50.41, y: 24.96))
            bezierPath.addCurve(to: CGPoint(x: 52.14, y: 31.1), controlPoint1: CGPoint(x: 51.48, y: 30.83), controlPoint2: CGPoint(x: 51.72, y: 31.1))
            bezierPath.close()
            bezierPath.move(to: CGPoint(x: 10.59, y: 39.78))
            bezierPath.addCurve(to: CGPoint(x: 11.34, y: 39.08), controlPoint1: CGPoint(x: 11.01, y: 39.78), controlPoint2: CGPoint(x: 11.25, y: 39.48))
            bezierPath.addLine(to: CGPoint(x: 11.62, y: 37.58))
            bezierPath.addCurve(to: CGPoint(x: 18.48, y: 31.95), controlPoint1: CGPoint(x: 12.43, y: 33.26), controlPoint2: CGPoint(x: 12.98, y: 32.88))
            bezierPath.addCurve(to: CGPoint(x: 19.18, y: 31.19), controlPoint1: CGPoint(x: 18.87, y: 31.86), controlPoint2: CGPoint(x: 19.18, y: 31.61))
            bezierPath.addCurve(to: CGPoint(x: 18.48, y: 30.44), controlPoint1: CGPoint(x: 19.18, y: 30.77), controlPoint2: CGPoint(x: 18.87, y: 30.5))
            bezierPath.addLine(to: CGPoint(x: 17.15, y: 30.19))
            bezierPath.addCurve(to: CGPoint(x: 11.34, y: 23.27), controlPoint1: CGPoint(x: 12.39, y: 29.29), controlPoint2: CGPoint(x: 12.29, y: 28.56))
            bezierPath.addCurve(to: CGPoint(x: 10.59, y: 22.6), controlPoint1: CGPoint(x: 11.25, y: 22.87), controlPoint2: CGPoint(x: 11.01, y: 22.6))
            bezierPath.addCurve(to: CGPoint(x: 9.83, y: 23.27), controlPoint1: CGPoint(x: 10.17, y: 22.6), controlPoint2: CGPoint(x: 9.92, y: 22.87))
            bezierPath.addLine(to: CGPoint(x: 9.56, y: 24.77))
            bezierPath.addCurve(to: CGPoint(x: 2.7, y: 30.44), controlPoint1: CGPoint(x: 8.74, y: 29.09), controlPoint2: CGPoint(x: 8.2, y: 29.48))
            bezierPath.addCurve(to: CGPoint(x: 2, y: 31.19), controlPoint1: CGPoint(x: 2.3, y: 30.5), controlPoint2: CGPoint(x: 2, y: 30.77))
            bezierPath.addCurve(to: CGPoint(x: 2.7, y: 31.95), controlPoint1: CGPoint(x: 2, y: 31.61), controlPoint2: CGPoint(x: 2.3, y: 31.86))
            bezierPath.addLine(to: CGPoint(x: 3.78, y: 32.14))
            bezierPath.addCurve(to: CGPoint(x: 9.83, y: 39.08), controlPoint1: CGPoint(x: 8.78, y: 33.04), controlPoint2: CGPoint(x: 8.87, y: 33.7))
            bezierPath.addCurve(to: CGPoint(x: 10.59, y: 39.78), controlPoint1: CGPoint(x: 9.92, y: 39.48), controlPoint2: CGPoint(x: 10.17, y: 39.78))
            bezierPath.close()
            bezierPath.move(to: CGPoint(x: 62.24, y: 65.64))
            bezierPath.addCurve(to: CGPoint(x: 66.9, y: 65.64), controlPoint1: CGPoint(x: 63.51, y: 66.94), controlPoint2: CGPoint(x: 65.69, y: 66.94))
            bezierPath.addCurve(to: CGPoint(x: 66.9, y: 60.98), controlPoint1: CGPoint(x: 68.14, y: 64.31), controlPoint2: CGPoint(x: 68.14, y: 62.25))
            bezierPath.addLine(to: CGPoint(x: 38.14, y: 32.13))
            bezierPath.addCurve(to: CGPoint(x: 33.48, y: 32.13), controlPoint1: CGPoint(x: 36.87, y: 30.86), controlPoint2: CGPoint(x: 34.69, y: 30.86))
            bezierPath.addCurve(to: CGPoint(x: 33.48, y: 36.82), controlPoint1: CGPoint(x: 32.21, y: 33.46), controlPoint2: CGPoint(x: 32.24, y: 35.55))
            bezierPath.addLine(to: CGPoint(x: 62.24, y: 65.64))
            bezierPath.close()
            bezierPath.move(to: CGPoint(x: 44.67, y: 44.86))
            bezierPath.addLine(to: CGPoint(x: 35.78, y: 35.97))
            bezierPath.addCurve(to: CGPoint(x: 35.6, y: 34.31), controlPoint1: CGPoint(x: 35.24, y: 35.42), controlPoint2: CGPoint(x: 35.11, y: 34.85))
            bezierPath.addCurve(to: CGPoint(x: 37.16, y: 34.42), controlPoint1: CGPoint(x: 36.08, y: 33.85), controlPoint2: CGPoint(x: 36.64, y: 33.93))
            bezierPath.addLine(to: CGPoint(x: 46.15, y: 43.41))
            bezierPath.addLine(to: CGPoint(x: 44.67, y: 44.86))
            bezierPath.close()
            bezierPath.move(to: CGPoint(x: 24.95, y: 66.12))
            bezierPath.addCurve(to: CGPoint(x: 23.93, y: 65.21), controlPoint1: CGPoint(x: 24.38, y: 66.12), controlPoint2: CGPoint(x: 23.99, y: 65.73))
            bezierPath.addLine(to: CGPoint(x: 23.73, y: 63.82))
            bezierPath.addCurve(to: CGPoint(x: 14.22, y: 55.54), controlPoint1: CGPoint(x: 22.78, y: 57.13), controlPoint2: CGPoint(x: 22.08, y: 57.04))
            bezierPath.addCurve(to: CGPoint(x: 13.31, y: 54.51), controlPoint1: CGPoint(x: 13.7, y: 55.41), controlPoint2: CGPoint(x: 13.31, y: 55.08))
            bezierPath.addCurve(to: CGPoint(x: 14.22, y: 53.48), controlPoint1: CGPoint(x: 13.31, y: 53.93), controlPoint2: CGPoint(x: 13.7, y: 53.54))
            bezierPath.addLine(to: CGPoint(x: 15.65, y: 53.27))
            bezierPath.addCurve(to: CGPoint(x: 23.93, y: 43.83), controlPoint1: CGPoint(x: 22.63, y: 52.24), controlPoint2: CGPoint(x: 22.93, y: 51.53))
            bezierPath.addCurve(to: CGPoint(x: 24.95, y: 42.89), controlPoint1: CGPoint(x: 23.99, y: 43.29), controlPoint2: CGPoint(x: 24.38, y: 42.89))
            bezierPath.addCurve(to: CGPoint(x: 25.98, y: 43.86), controlPoint1: CGPoint(x: 25.5, y: 42.89), controlPoint2: CGPoint(x: 25.89, y: 43.29))
            bezierPath.addLine(to: CGPoint(x: 26.15, y: 45.25))
            bezierPath.addCurve(to: CGPoint(x: 35.69, y: 53.48), controlPoint1: CGPoint(x: 27.03, y: 51.94), controlPoint2: CGPoint(x: 27.91, y: 52))
            bezierPath.addCurve(to: CGPoint(x: 36.6, y: 54.51), controlPoint1: CGPoint(x: 36.2, y: 53.57), controlPoint2: CGPoint(x: 36.6, y: 53.93))
            bezierPath.addCurve(to: CGPoint(x: 35.57, y: 55.54), controlPoint1: CGPoint(x: 36.6, y: 55.11), controlPoint2: CGPoint(x: 36.2, y: 55.41))
            bezierPath.addLine(to: CGPoint(x: 33.63, y: 55.86))
            bezierPath.addCurve(to: CGPoint(x: 25.98, y: 65.15), controlPoint1: CGPoint(x: 27.27, y: 56.96), controlPoint2: CGPoint(x: 26.87, y: 57.77))
            bezierPath.addCurve(to: CGPoint(x: 24.95, y: 66.12), controlPoint1: CGPoint(x: 25.89, y: 65.73), controlPoint2: CGPoint(x: 25.5, y: 66.12))
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
