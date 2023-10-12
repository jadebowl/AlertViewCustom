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
    private let hostViewController: UIViewController
    private let alertWindow: UIWindow
    
    public init() {
        self.alertView = AlertViewCustom()
        self.alertWindow = UIWindow()
        self.alertWindow.backgroundColor = .clear
        
        let viewController = UIViewController()
        viewController.view.backgroundColor = .clear
        self.hostViewController = viewController
        self.alertWindow.rootViewController = viewController
    }
    
    public func setupContents(delegate: AlertViewDelegate, accentColor: UIColor, backgroundColor: UIColor, backgroundRadius: CGFloat = 16, icon: UIImage? = nil, title: String? = nil, message: String? = nil, agreeTitle: String, agreeCornerRadius: CGFloat = 16, cancelTitle: String? = nil, position: AlertPosition? = .center) {
        
        self.delegate = delegate
        
        setupBackground(backgroundColor: backgroundColor, backgroundRadius: backgroundRadius)
        setupIcon(icon: icon, accentColor: accentColor)
        setupTitles(title: title, message: message)
        setupAgreeButton(accentColor: accentColor, agreeTitle: agreeTitle, agreeCornerRadius: agreeCornerRadius)
        setupCancelButton(accentColor: accentColor, cancelTitle: cancelTitle)
        
        guard let position else { return }
        setupPosition(position: position)
        setupHostVCConstraints()
    }
    
    func setupBackground(backgroundColor: UIColor, backgroundRadius: CGFloat) {
        alertView.backgroundView.backgroundColor = backgroundColor
        alertView.backgroundView.layer.cornerRadius = backgroundRadius
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
    
    func setupAgreeButton(accentColor: UIColor, agreeTitle: String, agreeCornerRadius: CGFloat) {
        alertView.agreeButton.setTitle(agreeTitle, for: .normal)
        alertView.agreeButton.setTitleColor(accentColor.contrastColor(), for: .normal)
        alertView.agreeButton.backgroundColor = accentColor
        alertView.agreeButton.layer.cornerRadius = agreeCornerRadius
    }
    
    func setupCancelButton(accentColor: UIColor, cancelTitle: String?) {
        alertView.cancelButton.setTitle(cancelTitle, for: .normal)
        alertView.cancelButton.setTitleColor(accentColor, for: .normal)
        alertView.cancelButton.isHidden = cancelTitle == nil
    }
    
    func setupPosition(position: AlertPosition) {
        switch position {
        case .bottom(let animation):
            alertView.alertBottomAnimation = animation
            alertView.backgroundView.translatesAutoresizingMaskIntoConstraints = false
            alertView.alertCenterConstraint?.isActive = false
            alertView.alertTopConstraint?.isActive = false
            alertView.alertBottomConstraint = alertView.backgroundView.bottomAnchor.constraint(equalTo: alertView.contentView.bottomAnchor, constant: -32)
            alertView.alertBottomConstraint?.isActive = true
        default:
            alertView.backgroundView.translatesAutoresizingMaskIntoConstraints = false
            alertView.alertBottomConstraint?.isActive = false
            alertView.alertTopConstraint = alertView.backgroundView.topAnchor.constraint(lessThanOrEqualTo: alertView.contentView.topAnchor, constant: 300)
            alertView.alertCenterConstraint = alertView.backgroundView.centerYAnchor.constraint(equalTo: alertView.contentView.centerYAnchor)
            alertView.alertCenterConstraint?.isActive = true
            alertView.alertTopConstraint?.isActive = true
        }
    }
    
    func setupHostVCConstraints() {
        hostViewController.view.addSubview(alertView)
        alertView.translatesAutoresizingMaskIntoConstraints = false
        alertView.topAnchor.constraint(equalTo: hostViewController.view.topAnchor, constant: 0).isActive = true
        alertView.bottomAnchor.constraint(equalTo: hostViewController.view.bottomAnchor, constant: 0).isActive = true
        alertView.leadingAnchor.constraint(equalTo: hostViewController.view.leadingAnchor, constant: 0).isActive = true
        alertView.trailingAnchor.constraint(equalTo: hostViewController.view.trailingAnchor, constant: 0).isActive = true
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
        }) { completed in
            guard completed else { return }
            self.removeWindow()
        }
    }
    
    private func removeWindow() {
        alertWindow.isHidden = true
        alertWindow.windowScene = nil
    }
}
