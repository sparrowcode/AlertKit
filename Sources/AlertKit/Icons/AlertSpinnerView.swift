import UIKit

class AlertSpinnerView: UIView {
    
    let activityIndicatorView: UIActivityIndicatorView
    
    init(style: UIActivityIndicatorView.Style) {
        self.activityIndicatorView = UIActivityIndicatorView(style: style)
        super.init(frame: .zero)
        self.backgroundColor = .clear
        addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        activityIndicatorView.sizeToFit()
        activityIndicatorView.center = .init(x: frame.width / 2, y: frame.height / 2)
    }

}
