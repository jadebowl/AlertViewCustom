import UIKit

/**
  All the alert properties you can customise
   - parameters:
      - accentColor: Applies color to icon, agree button background and cancel button title
      - backgroundColor
      - backgroundRadius: Applies a corner radius to the alert view
      - fontName: Applies a custom font to title, message, agree button and cancel button. 
                  Font files imported in the project folder have to be named with suffixes "-Regular" and "-Bold"
      - icon
      - title
      - message
      - agreeButton: With a title, a corner radius and a border width
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
                agreeButton: AgreeButton,
                cancelTitle: String? = nil,
                position: AlertPosition? = .center) {
        self.accentColor = accentColor
        self.backgroundColor = backgroundColor
        self.backgroundRadius = backgroundRadius
        self.fontName = fontName
        self.icon = icon
        self.title = title
        self.message = message
        self.agreeButton = agreeButton
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
    let agreeButton: AgreeButton
    let cancelTitle: String?
    let position: AlertPosition?
}

/**
  Customise the agree button
   - parameters:
      - title
      - cornerRadius
      - borderWidth: Applies a border with the accentColor and makes the background clear
*/
public struct AgreeButton {
    public init(title: String, cornerRadius: CGFloat = 16, borderWidth: CGFloat = 0) {
        self.title = title
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
    }
    let title: String
    let cornerRadius: CGFloat
    let borderWidth: CGFloat
}
