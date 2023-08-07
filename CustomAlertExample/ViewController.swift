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
        alert.setupContents(accentColor: .systemBlue, backgroundColor: .systemBackground, title: "I am a title", message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", agreeTitle: "Go to Settings", cancelTitle: "Cancel")
        view.addSubview(alert)
        alert.fadeIn(duration: 0.3)
        alert.translatesAutoresizingMaskIntoConstraints = false
        alert.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        alert.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        alert.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        alert.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
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
