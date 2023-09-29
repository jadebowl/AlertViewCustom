//
//  AppDelegate.swift
//  UIKitExamples
//
//  Created by Giada Ciotola on 28/09/23.
//

import UIKit
import CustomAlert

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AlertWindow.shared.rootViewController = ViewController()
        AlertWindow.shared.makeKeyAndVisible()
        return true
    }
}

