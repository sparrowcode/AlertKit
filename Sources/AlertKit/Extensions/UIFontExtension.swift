import UIKit

extension UIFont {
    
    static func preferredFont(forTextStyle style: TextStyle, weight: Weight, addPoints: CGFloat = 0) -> UIFont {
        // Base size at the default category, UIFontMetrics scales it once to the current one.
        let traits = UITraitCollection(preferredContentSizeCategory: .large)
        let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style, compatibleWith: traits)
        let font = UIFont.systemFont(ofSize: descriptor.pointSize + addPoints, weight: weight)
        let metrics = UIFontMetrics(forTextStyle: style)
        return metrics.scaledFont(for: font)
    }
}
