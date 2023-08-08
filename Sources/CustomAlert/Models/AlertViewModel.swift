import UIKit

public struct AlertViewModel {
    let accentColor: UIColor
    let backgroundColor: UIColor
    let icon: UIImage?
    let title: String
    let message: String
    let agreeTitle: String
    let cancelTitle: String
   
    public init(accentColor: UIColor, backgroundColor: UIColor, icon: UIImage? = nil, title: String, message: String, agreeTitle: String, cancelTitle: String) {
        self.accentColor = accentColor
        self.backgroundColor = backgroundColor
        self.icon = icon
        self.title = title
        self.message = message
        self.agreeTitle = agreeTitle
        self.cancelTitle = cancelTitle
    }
}
