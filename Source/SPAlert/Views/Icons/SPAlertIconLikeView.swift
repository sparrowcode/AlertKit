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

public class SPAlertIconLikeView: UIView {
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        LikeDraw.draw(frame: rect, resizing: .aspectFit, fillColor: self.tintColor)
    }
    
    class LikeDraw: NSObject {
        
        @objc dynamic public class func draw(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 60, height: 56), resizing: ResizingBehavior = .aspectFit, fillColor: UIColor = UIColor(red: 0.349, green: 0.345, blue: 0.353, alpha: 1.000)) {
            let context = UIGraphicsGetCurrentContext()!
            context.saveGState()
            let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 62, height: 65), target: targetFrame)
            context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
            context.scaleBy(x: resizedFrame.width / 62, y: resizedFrame.height / 65)
            context.saveGState()
            context.beginTransparencyLayer(auxiliaryInfo: nil)
            let clipPath = UIBezierPath()
            clipPath.move(to: CGPoint(x: 49.72, y: 61.4))
            clipPath.addLine(to: CGPoint(x: 49.9, y: 61.36))
            clipPath.addCurve(to: CGPoint(x: 54.26, y: 56.74), controlPoint1: CGPoint(x: 52.08, y: 60.85), controlPoint2: CGPoint(x: 54.26, y: 59.43))
            clipPath.addCurve(to: CGPoint(x: 53.68, y: 54.41), controlPoint1: CGPoint(x: 54.26, y: 55.74), controlPoint2: CGPoint(x: 54.02, y: 55.02))
            clipPath.addLine(to: CGPoint(x: 53.59, y: 54.26))
            clipPath.addCurve(to: CGPoint(x: 53.73, y: 53.47), controlPoint1: CGPoint(x: 53.37, y: 53.89), controlPoint2: CGPoint(x: 53.42, y: 53.61))
            clipPath.addCurve(to: CGPoint(x: 56.97, y: 48.86), controlPoint1: CGPoint(x: 55.49, y: 52.69), controlPoint2: CGPoint(x: 56.97, y: 51.13))
            clipPath.addCurve(to: CGPoint(x: 56.12, y: 45.83), controlPoint1: CGPoint(x: 56.97, y: 47.69), controlPoint2: CGPoint(x: 56.66, y: 46.62))
            clipPath.addLine(to: CGPoint(x: 55.99, y: 45.65))
            clipPath.addCurve(to: CGPoint(x: 56.25, y: 44.58), controlPoint1: CGPoint(x: 55.66, y: 45.23), controlPoint2: CGPoint(x: 55.74, y: 44.89))
            clipPath.addCurve(to: CGPoint(x: 58.37, y: 40.39), controlPoint1: CGPoint(x: 57.53, y: 43.86), controlPoint2: CGPoint(x: 58.37, y: 42.24))
            clipPath.addCurve(to: CGPoint(x: 57.17, y: 36.98), controlPoint1: CGPoint(x: 58.37, y: 39.11), controlPoint2: CGPoint(x: 57.95, y: 37.68))
            clipPath.addCurve(to: CGPoint(x: 57.34, y: 35.92), controlPoint1: CGPoint(x: 56.75, y: 36.59), controlPoint2: CGPoint(x: 56.83, y: 36.31))
            clipPath.addCurve(to: CGPoint(x: 58.73, y: 32.29), controlPoint1: CGPoint(x: 58.23, y: 35.22), controlPoint2: CGPoint(x: 58.73, y: 33.88))
            clipPath.addCurve(to: CGPoint(x: 53.84, y: 27.34), controlPoint1: CGPoint(x: 58.73, y: 29.55), controlPoint2: CGPoint(x: 56.61, y: 27.34))
            clipPath.addLine(to: CGPoint(x: 43.86, y: 27.34))
            clipPath.addCurve(to: CGPoint(x: 39.64, y: 23.96), controlPoint1: CGPoint(x: 41.32, y: 27.34), controlPoint2: CGPoint(x: 39.64, y: 26.03))
            clipPath.addCurve(to: CGPoint(x: 44.4, y: 8.16), controlPoint1: CGPoint(x: 39.64, y: 20.1), controlPoint2: CGPoint(x: 44.4, y: 13.17))
            clipPath.addCurve(to: CGPoint(x: 40.48, y: 4), controlPoint1: CGPoint(x: 44.4, y: 5.57), controlPoint2: CGPoint(x: 42.69, y: 4))
            clipPath.addCurve(to: CGPoint(x: 36.35, y: 7.52), controlPoint1: CGPoint(x: 38.47, y: 4), controlPoint2: CGPoint(x: 37.44, y: 5.4))
            clipPath.addCurve(to: CGPoint(x: 22.26, y: 28.04), controlPoint1: CGPoint(x: 32.21, y: 15.74), controlPoint2: CGPoint(x: 26.56, y: 22.36))
            clipPath.addCurve(to: CGPoint(x: 16.75, y: 43.69), controlPoint1: CGPoint(x: 18.62, y: 32.9), controlPoint2: CGPoint(x: 16.84, y: 36.98))
            clipPath.addCurve(to: CGPoint(x: 38.11, y: 61.97), controlPoint1: CGPoint(x: 16.61, y: 54), controlPoint2: CGPoint(x: 24.97, y: 61.86))
            clipPath.addLine(to: CGPoint(x: 41.99, y: 62))
            clipPath.addCurve(to: CGPoint(x: 49.72, y: 61.4), controlPoint1: CGPoint(x: 45.51, y: 62.02), controlPoint2: CGPoint(x: 48.13, y: 61.77))
            clipPath.addLine(to: CGPoint(x: 49.72, y: 61.4))
            clipPath.close()
            clipPath.move(to: CGPoint(x: 3, y: 43.89))
            clipPath.addCurve(to: CGPoint(x: 14.18, y: 28.37), controlPoint1: CGPoint(x: 3, y: 35.19), controlPoint2: CGPoint(x: 7.86, y: 28.37))
            clipPath.addLine(to: CGPoint(x: 18.29, y: 28.37))
            clipPath.addLine(to: CGPoint(x: 17.96, y: 28.79))
            clipPath.addCurve(to: CGPoint(x: 12.95, y: 43.61), controlPoint1: CGPoint(x: 15.56, y: 31.9), controlPoint2: CGPoint(x: 13.06, y: 36.82))
            clipPath.addCurve(to: CGPoint(x: 20.22, y: 59.29), controlPoint1: CGPoint(x: 12.84, y: 50.01), controlPoint2: CGPoint(x: 15.16, y: 55.6))
            clipPath.addLine(to: CGPoint(x: 15.21, y: 59.29))
            clipPath.addCurve(to: CGPoint(x: 3, y: 43.89), controlPoint1: CGPoint(x: 8.23, y: 59.29), controlPoint2: CGPoint(x: 3, y: 52.27))
            clipPath.close()
            clipPath.addClip()
            let rectanglePath = UIBezierPath(rect: CGRect(x: -2.02, y: -1, width: 65.75, height: 68))
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
