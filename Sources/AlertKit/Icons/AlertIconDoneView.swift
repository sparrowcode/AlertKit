import UIKit

public class AlertIconDoneView: UIView, AlertIconAnimatable {
    
    private let lineThick: CGFloat
    
    init(lineThick: CGFloat) {
        self.lineThick = lineThick
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func animate() {
        let length = frame.width
        let animatablePath = UIBezierPath()
        animatablePath.move(to: CGPoint(x: length * 0.196, y: length * 0.527))
        animatablePath.addLine(to: CGPoint(x: length * 0.47, y: length * 0.777))
        animatablePath.addLine(to: CGPoint(x: length * 0.99, y: length * 0.25))
        
        let animatableLayer = CAShapeLayer()
        animatableLayer.path = animatablePath.cgPath
        animatableLayer.fillColor = UIColor.clear.cgColor
        animatableLayer.strokeColor = tintColor?.cgColor
        animatableLayer.lineWidth = lineThick
        animatableLayer.lineCap = .round
        animatableLayer.lineJoin = .round
        animatableLayer.strokeEnd = 0
        layer.addSublayer(animatableLayer)
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 0.3
        animation.fromValue = 0
        animation.toValue = 1
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animatableLayer.strokeEnd = 1
        animatableLayer.add(animation, forKey: "animation")
    }
}
