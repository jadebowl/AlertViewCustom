import UIKit

public protocol AlertViewDelegate {
    func agreeAction()
    func cancelAction()
}

public class AlertView {
    public var delegate: AlertViewDelegate? {
        didSet {
            alertView.delegate = delegate
        }
    }
    private let alertView: AlertViewCustom
    private let hostVC: UIViewController
    private let alertWindow: UIWindow

    public init() {
        self.alertView = AlertViewCustom()
        self.alertWindow = UIWindow()
        self.alertWindow.backgroundColor = .clear
        
        let viewController = UIViewController()
        viewController.view.backgroundColor = .clear
        self.hostVC = viewController
        self.alertWindow.rootViewController = viewController
    }
    
    public func setupContents(delegate: AlertViewDelegate, settings: AlertSettings) {
        self.delegate = delegate
        setupContrastColor(accentColor: settings.accentColor, 
                           backgroundColor: settings.backgroundColor,
                           borderWidth: settings.agreeButton.borderWidth)
        setupBackground(backgroundColor: settings.backgroundColor, backgroundRadius: settings.backgroundRadius)
        setupFont(fontName: settings.fontName)
        setupIcon(icon: settings.icon, accentColor: settings.accentColor)
        setupTitles(title: settings.title, message: settings.message)
        setupAgreeButton(accentColor: settings.accentColor,
                         title: settings.agreeButton.title,
                         cornerRadius: settings.agreeButton.cornerRadius,
                         borderWidth: settings.agreeButton.borderWidth)
        setupCancelButton(accentColor: settings.accentColor, cancelTitle: settings.cancelTitle)
        setupPosition(position: settings.position)
        setupHostVCConstraints()
    }
    
    func setupContrastColor(accentColor: UIColor, backgroundColor: UIColor, borderWidth: CGFloat) {
        alertView.titleLabel.textColor = backgroundColor.contrastColor()
        alertView.messageLabel.textColor = backgroundColor.contrastColor()
        
        let titleColor = borderWidth != 0 ? backgroundColor.contrastColor() : accentColor.contrastColor()
        alertView.agreeButton.setTitleColor(titleColor, for: .normal)
    }
    
    func setupBackground(backgroundColor: UIColor, backgroundRadius: CGFloat) {
        alertView.backgroundView.backgroundColor = backgroundColor
        alertView.backgroundView.layer.cornerRadius = backgroundRadius
    }
    
    func setupFont(fontName: String?) {
        guard fontName != nil, let fontName else {
            return
        }
        alertView.titleLabel.font = UIFont.font(for: .headline, name: fontName)
        alertView.messageLabel.font = UIFont.font(for: .body, name: fontName)
        alertView.agreeButton.titleLabel?.font = UIFont.font(for: .button, name: fontName)
        alertView.cancelButton.titleLabel?.font = UIFont.font(for: .body, name: fontName)
    }
    
    func setupIcon(icon: UIImage?, accentColor: UIColor) {
        alertView.iconImageView.image = icon
        alertView.iconImageView.tintColor = accentColor
        alertView.iconImageView.isHidden = alertView.iconImageView.image == nil
    }
    
    func setupTitles(title: String?, message: String?) {
        alertView.titleLabel.text = title
        alertView.titleLabel.isHidden = alertView.titleLabel.text == nil
        alertView.messageLabel.text = message
        alertView.messageLabel.isHidden = alertView.messageLabel.text == nil
    }
    
    func setupAgreeButton(accentColor: UIColor, title: String, cornerRadius: CGFloat, borderWidth: CGFloat) {
        alertView.agreeButton.setTitle(title, for: .normal)
        alertView.agreeButton.backgroundColor = borderWidth != 0 ? .clear : accentColor
        alertView.agreeButton.layer.borderColor = accentColor.cgColor
        alertView.agreeButton.layer.borderWidth = borderWidth
        alertView.agreeButton.layer.cornerRadius = cornerRadius
    }
    
    func setupCancelButton(accentColor: UIColor, cancelTitle: String?) {
        alertView.cancelButton.setTitle(cancelTitle, for: .normal)
        alertView.cancelButton.setTitleColor(accentColor, for: .normal)
        alertView.cancelButton.isHidden = cancelTitle == nil
    }
    
    func setupPosition(position: AlertPosition?) {
        guard let position else { return }
        switch position {
        case .bottom(let animation):
            alertView.alertBottomAnimation = animation
            alertView.backgroundView.translatesAutoresizingMaskIntoConstraints = false
            alertView.alertCenterConstraint?.isActive = false
            alertView.alertTopConstraint?.isActive = false
            alertView.alertBottomConstraint = alertView.backgroundView.bottomAnchor
                .constraint(equalTo: alertView.contentView.bottomAnchor, constant: -32)
            alertView.alertBottomConstraint?.isActive = true
        default:
            alertView.backgroundView.translatesAutoresizingMaskIntoConstraints = false
            alertView.alertBottomConstraint?.isActive = false
            alertView.alertTopConstraint = alertView.backgroundView.topAnchor
                .constraint(lessThanOrEqualTo: alertView.contentView.topAnchor, constant: 300)
            alertView.alertCenterConstraint = alertView.backgroundView.centerYAnchor
                .constraint(equalTo: alertView.contentView.centerYAnchor)
            alertView.alertCenterConstraint?.isActive = true
            alertView.alertTopConstraint?.isActive = true
        }
    }
    
    func setupHostVCConstraints() {
        hostVC.view.addSubview(alertView)
        alertView.translatesAutoresizingMaskIntoConstraints = false
        alertView.topAnchor.constraint(equalTo: hostVC.view.topAnchor, constant: 0).isActive = true
        alertView.bottomAnchor.constraint(equalTo: hostVC.view.bottomAnchor, constant: 0).isActive = true
        alertView.leadingAnchor.constraint(equalTo: hostVC.view.leadingAnchor, constant: 0).isActive = true
        alertView.trailingAnchor.constraint(equalTo: hostVC.view.trailingAnchor, constant: 0).isActive = true
        alertView.alpha = 0.0
    }
    
    public func fadeIn(duration: TimeInterval) {
        if let activeScene = UIApplication.shared.activeWindowScene {
            alertWindow.windowScene = activeScene
            alertWindow.frame = activeScene.coordinateSpace.bounds
        }
        alertWindow.isHidden = false
        alertView.isHidden = false
        if alertView.alertBottomAnimation {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.alertView.alertBottomConstraint?.constant = -96
                UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut) {
                    self.alertView.contentView.layoutIfNeeded()
                    self.alertView.alpha = 1
                }
            }
        } else {
            UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut) {
                self.alertView.alpha = 1
            }
        }
    }
    
    public func removeFromSuperView(duration: TimeInterval) {
        if alertView.alertBottomAnimation {
            alertView.alertBottomConstraint?.constant = -32
        }
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: {
            self.alertView.alpha = 0.0
            if self.alertView.alertBottomAnimation {
                self.alertView.contentView.layoutIfNeeded()
            }
        }, completion: { completed in
            guard completed else { return }
            self.removeWindow()
        })
    }
    
    private func removeWindow() {
        alertWindow.isHidden = true
        alertWindow.windowScene = nil
    }
}
