//
//  ContentViewModel.swift
//  SwiftUIExamples
//
//  Created by Giada Ciotola on 18/10/23.
//

import SwiftUI
import AlertViewCustom

class ContentViewModel: ObservableObject {
    let alert = AlertView()
    
    func showAlert() {
        let agreeButton = AgreeButton(title: "Go to Settings")
        let alertSettings = AlertSettings(accentColor: .systemBlue,
                                          backgroundColor: .systemBackground,
                                          icon: UIImage(systemName: "hand.wave"),
                                          title: "I am a title",
                                          message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                          agreeButton: agreeButton,
                                          cancelTitle: "Cancel",
                                          position: .center)
        alert.setupContents(delegate: self, settings: alertSettings)
        alert.fadeIn(duration: 0.3)
    }
}

extension ContentViewModel: AlertViewDelegate {
    func agreeAction() {
        // MARK: - Example: Go to Settings
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }
        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                print("Settings opened: \(success)")
            })
        }
    }
    
    func cancelAction() {
        alert.removeFromSuperView(duration: 0.3)
    }
}
