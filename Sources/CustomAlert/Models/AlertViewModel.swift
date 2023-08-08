import UIKit

public struct AlertViewModel {
    let accentColor: UIColor
    let backgroundColor: UIColor
    let icon: UIImage?
    let title: String?
    let message: String?
    let agreeTitle: String
    let agreeCornerRadius: CGFloat
    let cancelTitle: String?
    let position: AlertPosition?
   
    public init(accentColor: UIColor, backgroundColor: UIColor, icon: UIImage? = nil, title: String? = nil, message: String? = nil, agreeTitle: String, agreeCornerRadius: CGFloat = 16, cancelTitle: String? = nil, position: AlertPosition? = .center) {
        self.accentColor = accentColor
        self.backgroundColor = backgroundColor
        self.icon = icon
        self.title = title
        self.message = message
        self.agreeTitle = agreeTitle
        self.agreeCornerRadius = agreeCornerRadius
        self.cancelTitle = cancelTitle
        self.position = position
    }
}
