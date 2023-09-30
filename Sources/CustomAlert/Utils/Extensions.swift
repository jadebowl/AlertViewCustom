import UIKit

internal extension UIColor {
    func contrastColor() -> UIColor {
        var d = CGFloat(0)
        var r = CGFloat(0)
        var g = CGFloat(0)
        var b = CGFloat(0)
        var a = CGFloat(0)
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let luminance = 1 - ((0.299 * r) + (0.587 * g) + (0.114 * b))
        
        if luminance < 0.5 {
            d = CGFloat(0)
        } else {
            d = CGFloat(1)
        }
        return UIColor(red: d, green: d, blue: d, alpha: 1)
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