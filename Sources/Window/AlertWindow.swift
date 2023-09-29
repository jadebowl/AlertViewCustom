//
//  GlobalWindow.swift
//  CustomAlert
//
//  Created by Giada Ciotola on 29/09/23.
//

import UIKit

public protocol AlertWindowDelegate {
    func agreeAction()
    func cancelAction()
}

public class AlertWindow: UIWindow {
    public static let shared = AlertWindow()

    private var alertView: AlertView!
    public var delegate: AlertWindowDelegate?
    
    var alertBottomConstraint: NSLayoutConstraint?
    var alertBottomAnimation = false

    private override init(frame: CGRect) {
        super.init(frame: frame)
        setupWindow()
    }

    convenience init() {
        self.init(frame: UIScreen.main.bounds)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupWindow() {
        rootViewController = UIViewController()

        alertView = AlertView(frame: bounds)
        alertView.alpha = 0.0
        alertView.isHidden = true

        rootViewController?.view.addSubview(alertView)

        makeKeyAndVisible()
    }
    
    public func setupContents(accentColor: UIColor, backgroundColor: UIColor, backgroundRadius: CGFloat = 16, icon: UIImage? = nil, title: String? = nil, message: String? = nil, agreeTitle: String, agreeCornerRadius: CGFloat = 16, cancelTitle: String? = nil, position: AlertPosition? = .center, bottomAnimation: Bool = false, hostVC: UIViewController) {
        alertView.backgroundView.backgroundColor = backgroundColor
        alertView.backgroundView.layer.cornerRadius = backgroundRadius
        alertView.iconImageView.image = icon
        alertView.iconImageView.tintColor = accentColor
        alertView.iconImageView.isHidden = alertView.iconImageView.image == nil
        alertView.titleLabel.text = title
        alertView.titleLabel.isHidden = alertView.titleLabel.text == nil
        alertView.messageLabel.text = message
        alertView.messageLabel.isHidden = alertView.messageLabel.text == nil
        alertView.agreeButton.setTitle(agreeTitle, for: .normal)
        alertView.agreeButton.setTitleColor(accentColor.contrastColor(), for: .normal)
        alertView.agreeButton.backgroundColor = accentColor
        alertView.agreeButton.layer.cornerRadius = agreeCornerRadius
        alertView.cancelButton.setTitle(cancelTitle, for: .normal)
        alertView.cancelButton.setTitleColor(accentColor, for: .normal)
        alertView.cancelButton.isHidden = cancelTitle == nil
        alertView.alertBottomAnimation = bottomAnimation
        
        switch position {
        case .bottom:
            alertView.backgroundView.translatesAutoresizingMaskIntoConstraints = false
            alertView.alertCenterConstraint?.isActive = false
            alertView.alertTopConstraint?.isActive = false
            
            alertView.alertBottomConstraint = alertView.backgroundView.bottomAnchor.constraint(equalTo: alertView.contentView.bottomAnchor, constant: -32)
            alertView.alertBottomConstraint?.isActive = true
            
        default:
            alertView.backgroundView.translatesAutoresizingMaskIntoConstraints = false
            alertView.alertCenterConstraint?.isActive = true
            alertView.alertTopConstraint?.isActive = true
            
            alertView.alertBottomConstraint?.isActive = false
        }
        
        hostVC.view.addSubview(alertView)
        alertView.translatesAutoresizingMaskIntoConstraints = false
        alertView.topAnchor.constraint(equalTo: hostVC.view.topAnchor, constant: 0).isActive = true
        alertView.bottomAnchor.constraint(equalTo: hostVC.view.bottomAnchor, constant: 0).isActive = true
        alertView.leadingAnchor.constraint(equalTo: hostVC.view.leadingAnchor, constant: 0).isActive = true
        alertView.trailingAnchor.constraint(equalTo: hostVC.view.trailingAnchor, constant: 0).isActive = true
        alertView.alpha = 0.0
    }
    
    public func fadeIn(duration: TimeInterval) {
        alertView.isHidden = false
        if alertBottomAnimation {
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
        alertView.isHidden = true
        UIView.animate(withDuration: duration, animations: {
            self.alertView.alpha = 0.0 }, completion: {( value: Bool ) in
                self.alertView.removeFromSuperview()
            })
    }
}
