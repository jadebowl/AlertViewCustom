//
//  ContentView.swift
//  SwiftUIExamples
//
//  Created by Giada Ciotola on 28/09/23.
//

import SwiftUI
import AlertViewCustom

struct ContentView: View {
    var alert = AlertView()
    
    var body: some View {
        Color.blue
            .ignoresSafeArea(.all)
            .overlay(
                VStack {
                    Button {
                        self.showAlert()
                    } label: {
                        Text("Show Alert")
                    }.font(.system(size: 17, weight: .semibold, design: .default))
                        .foregroundColor(.white)
                })
    }
    
    private func showAlert() {
        let alertSettings = AlertSettings(accentColor: .systemBlue,
                                        backgroundColor: .systemBackground,
                                        icon: UIImage(systemName: "hand.wave"),
                                        title: "I am a title",
                                        message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                        agreeTitle: "Go to Settings",
                                        cancelTitle: "Cancel")
        alert.setupContents(delegate: self, settings: alertSettings)
        alert.fadeIn(duration: 0.3)
    }
}

extension ContentView: AlertViewDelegate {
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

#Preview {
    ContentView()
}
