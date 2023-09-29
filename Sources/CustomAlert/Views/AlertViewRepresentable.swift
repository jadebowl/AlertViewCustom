//
//  Alert.swift
//  CustomAlert
//
//  Created by Giada Ciotola on 29/09/23.
//

import UIKit
import SwiftUI

public struct AlertViewRepresentable: UIViewRepresentable {
    public init(accentColor: UIColor, backgroundColor: UIColor, backgroundRadius: CGFloat = 16, icon: UIImage? = nil, title: String? = nil, message: String? = nil, agreeTitle: String, agreeCornerRadius: CGFloat = 16, cancelTitle: String? = nil, bottomAnimation: Bool = false) {
        self.accentColor = accentColor
        self.backgroundColor = backgroundColor
        self.backgroundRadius = backgroundRadius
        self.icon = icon
        self.title = title
        self.message = message
        self.agreeTitle = agreeTitle
        self.agreeCornerRadius = agreeCornerRadius
        self.cancelTitle = cancelTitle
        self.bottomAnimation = bottomAnimation
    }
    var accentColor: UIColor
    var backgroundColor: UIColor
    var backgroundRadius: CGFloat = 16
    var icon: UIImage? = nil
    var title: String? = nil
    var message: String? = nil
    var agreeTitle: String
    var agreeCornerRadius: CGFloat = 16
    var cancelTitle: String? = nil
    var bottomAnimation: Bool = false
    
    public func makeUIView(context: Context) -> UIView {
        AlertView()
    }
    
    public func updateUIView(_ uiView: UIView, context: Context) {
        let alert = uiView as? AlertView
        alert?.backgroundView.backgroundColor = backgroundColor
        alert?.backgroundView.layer.cornerRadius = backgroundRadius
        alert?.iconImageView.image = icon
        alert?.iconImageView.tintColor = accentColor
        alert?.iconImageView.isHidden = alert?.iconImageView.image == nil
        alert?.titleLabel.text = title
        alert?.titleLabel.isHidden = alert?.titleLabel.text == nil
        alert?.messageLabel.text = message
        alert?.messageLabel.isHidden = alert?.messageLabel.text == nil
        alert?.agreeButton.setTitle(agreeTitle, for: .normal)
        alert?.agreeButton.setTitleColor(accentColor.contrastColor(), for: .normal)
        alert?.agreeButton.backgroundColor = accentColor
        alert?.agreeButton.layer.cornerRadius = agreeCornerRadius
        alert?.cancelButton.setTitle(cancelTitle, for: .normal)
        alert?.cancelButton.setTitleColor(accentColor, for: .normal)
        alert?.cancelButton.isHidden = cancelTitle == nil
        alert?.alertBottomAnimation = bottomAnimation
    }
}


