//
//  ViewController.swift
//  UIKitExamples
//
//  Created by Giada Ciotola on 28/09/23.
//

import UIKit
import AlertViewCustom

class ViewController: UIViewController {

    var alert = AlertView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func setupAlert() {
        alert.setupContents(delegate: self,
                            accentColor: .systemBlue,
                            backgroundColor: .systemBackground,
                            icon: UIImage(systemName: "hand.wave"),
                            title: "I am a title",
                            message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                            agreeTitle: "Go to Settings",
                            cancelTitle: "Cancel",
                            position: .bottom(animated: true))
        alert.fadeIn(duration: 0.3)
    }

    @IBAction func showAlert(_ sender: UIButton) {
        setupAlert()
    }
}

extension ViewController: AlertViewDelegate {
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


