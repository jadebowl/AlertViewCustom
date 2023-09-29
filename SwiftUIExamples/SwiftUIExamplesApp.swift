//
//  SwiftUIExamplesApp.swift
//  SwiftUIExamples
//
//  Created by Giada Ciotola on 28/09/23.
//

import SwiftUI
import CustomAlert

@main
struct SwiftUIExamplesApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        AlertWindow.shared.fadeIn(duration: 0.3)
        return true
    }
}
