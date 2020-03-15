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

public class SPAlertIconSearchView: UIView {
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        SearchDraw.draw(frame: rect, resizing: .aspectFit, fillColor: self.tintColor)
    }
    
    class SearchDraw: NSObject {
        
        @objc dynamic public class func draw(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 60, height: 56), resizing: ResizingBehavior = .aspectFit, fillColor: UIColor = UIColor(red: 0.349, green: 0.345, blue: 0.353, alpha: 1.000)) {
            let context = UIGraphicsGetCurrentContext()!
            context.saveGState()
            let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 61, height: 63), target: targetFrame)
            context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
            context.scaleBy(x: resizedFrame.width / 61, y: resizedFrame.height / 63)
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 24.46, y: 49.92))
            bezierPath.addCurve(to: CGPoint(x: 38.1, y: 45.53), controlPoint1: CGPoint(x: 29.56, y: 49.92), controlPoint2: CGPoint(x: 34.26, y: 48.28))
            bezierPath.addLine(to: CGPoint(x: 52.56, y: 59.99))
            bezierPath.addCurve(to: CGPoint(x: 55.06, y: 61), controlPoint1: CGPoint(x: 53.23, y: 60.66), controlPoint2: CGPoint(x: 54.12, y: 61))
            bezierPath.addCurve(to: CGPoint(x: 58.45, y: 57.52), controlPoint1: CGPoint(x: 57.05, y: 61), controlPoint2: CGPoint(x: 58.45, y: 59.47))
            bezierPath.addCurve(to: CGPoint(x: 57.47, y: 55.08), controlPoint1: CGPoint(x: 58.45, y: 56.61), controlPoint2: CGPoint(x: 58.15, y: 55.75))
            bezierPath.addLine(to: CGPoint(x: 43.1, y: 40.68))
            bezierPath.addCurve(to: CGPoint(x: 47.92, y: 26.46), controlPoint1: CGPoint(x: 46.12, y: 36.71), controlPoint2: CGPoint(x: 47.92, y: 31.8))
            bezierPath.addCurve(to: CGPoint(x: 24.46, y: 3), controlPoint1: CGPoint(x: 47.92, y: 13.56), controlPoint2: CGPoint(x: 37.37, y: 3))
            bezierPath.addCurve(to: CGPoint(x: 1, y: 26.46), controlPoint1: CGPoint(x: 11.56, y: 3), controlPoint2: CGPoint(x: 1, y: 13.56))
            bezierPath.addCurve(to: CGPoint(x: 24.46, y: 49.92), controlPoint1: CGPoint(x: 1, y: 39.37), controlPoint2: CGPoint(x: 11.56, y: 49.92))
            bezierPath.close()
            bezierPath.move(to: CGPoint(x: 24.46, y: 44.86))
            bezierPath.addCurve(to: CGPoint(x: 6.06, y: 26.46), controlPoint1: CGPoint(x: 14.39, y: 44.86), controlPoint2: CGPoint(x: 6.06, y: 36.53))
            bezierPath.addCurve(to: CGPoint(x: 24.46, y: 8.06), controlPoint1: CGPoint(x: 6.06, y: 16.39), controlPoint2: CGPoint(x: 14.39, y: 8.06))
            bezierPath.addCurve(to: CGPoint(x: 42.86, y: 26.46), controlPoint1: CGPoint(x: 34.53, y: 8.06), controlPoint2: CGPoint(x: 42.86, y: 16.39))
            bezierPath.addCurve(to: CGPoint(x: 24.46, y: 44.86), controlPoint1: CGPoint(x: 42.86, y: 36.53), controlPoint2: CGPoint(x: 34.53, y: 44.86))
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
