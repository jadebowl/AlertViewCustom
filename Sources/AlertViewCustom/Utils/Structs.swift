import UIKit

/**
  Customise your alert
   - parameters:
      - accentColor: applies color to icon, agree button background and cancel button title
      - backgroundColor
      - backgroundRadius: applies a corner radius to the alert view
      - fontName: applies a custom font to title, message, agree button and cancel button
      - icon
      - title
      - message
      - agreeTitle
      - agreeCornerRadius: applies a corner radius to the agree button
      - cancelTitle
      - position
*/
public struct AlertSettings {
    public init(accentColor: UIColor,
                backgroundColor: UIColor,
                backgroundRadius: CGFloat = 16,
                fontName: String? = nil,
                icon: UIImage? = nil,
                title: String? = nil,
                message: String? = nil,
                agreeTitle: String,
                agreeCornerRadius: CGFloat = 16,
                cancelTitle: String? = nil,
                position: AlertPosition? = .center) {
        self.accentColor = accentColor
        self.backgroundColor = backgroundColor
        self.backgroundRadius = backgroundRadius
        self.fontName = fontName
        self.icon = icon
        self.title = title
        self.message = message
        self.agreeTitle = agreeTitle
        self.agreeCornerRadius = agreeCornerRadius
        self.cancelTitle = cancelTitle
        self.position = position
    }
    let accentColor: UIColor
    let backgroundColor: UIColor
    let backgroundRadius: CGFloat
    let fontName: String?
    let icon: UIImage?
    let title: String?
    let message: String?
    let agreeTitle: String
    let agreeCornerRadius: CGFloat
    let cancelTitle: String?
    let position: AlertPosition?
}
