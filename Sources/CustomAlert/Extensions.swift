import UIKit

internal extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: .module)
        }
        return instantiateFromNib()
    }
}

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
            d = CGFloat(0) /// bright colors - black font
        } else {
            d = CGFloat(1) /// dark colors - white font
        }
        
        return UIColor(red: d, green: d, blue: d, alpha: 1)
    }
}

public extension UIView {
    func fadeIn(duration: TimeInterval) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1
        })
    }
    
    func removeFromSuperView(duration: TimeInterval) {
        UIView.animate(withDuration: duration, animations: {self.alpha = 0.0}, completion: {(value: Bool) in
            self.removeFromSuperview()
        })
    }
}