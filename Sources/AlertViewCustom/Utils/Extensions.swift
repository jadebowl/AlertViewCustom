import UIKit

internal extension UIColor {
    func contrastColor() -> UIColor {
        var bit = CGFloat(0)
        var red = CGFloat(0)
        var green = CGFloat(0)
        var blue = CGFloat(0)
        var alpha = CGFloat(0)
        
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        let luminance = 1 - ((0.299 * red) + (0.587 * green) + (0.114 * blue))
        if luminance < 0.5 {
            bit = CGFloat(0)
        } else {
            bit = CGFloat(1)
        }
        return UIColor(red: bit, green: bit, blue: bit, alpha: 1)
    }
}

extension UIWindow {
    func dismiss() {
        isHidden = true
        windowScene = nil
    }
}

internal extension UIApplication {
    var activeWindowScene: UIWindowScene? {
        return connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .first { $0.activationState == .foregroundActive }
    }
}
