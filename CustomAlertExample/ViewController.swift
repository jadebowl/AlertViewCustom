//
//  ViewController.swift
//  CustomAlertExample
//
//  Created by Jade Bowl on 07/08/23.
//

import UIKit
import CustomAlert

class ViewController: UIViewController {

    let alert = AlertView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alert.delegate = self
    }

    func setupAlert() {
        alert.setupContents(accentColor: .systemBlue,
                            backgroundColor: .systemBackground,
                            icon: UIImage(systemName: "hand.wave"),
                            title: "I am a title",
                            message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                            agreeTitle: "Go to Settings",
                            cancelTitle: "Cancel",
                            position: .bottom,
                            bottomAnimation: true,
                            hostVC: self)
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
