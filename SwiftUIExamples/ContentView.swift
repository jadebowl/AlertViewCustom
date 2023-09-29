//
//  ContentView.swift
//  SwiftUIExamples
//
//  Created by Giada Ciotola on 28/09/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSheet = false
    
    var body: some View {
        Color.blue
            .ignoresSafeArea(.all)
            .overlay(
                VStack {
                    Button {
                        withAnimation {
                            showingSheet.toggle()
                        }
                        
                    } label: {
                        Text("Show Alert")
                    }
                    .font(.system(size: 17, weight: .semibold, design: .default))
                    .foregroundColor(.black)
                }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .overlay(showingSheet ? ViewAlert(accentColor: .systemBlue,
                                                      backgroundColor: .systemBackground,
                                                      icon: UIImage(systemName: "hand.wave"),
                                                      title: "I am a title",
                                                      message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                                      agreeTitle: "Go to Settings",
                                                      cancelTitle: "Cancel",
                                                      bottomAnimation: true) : nil))
    }
}

#Preview {
    ContentView()
}

struct ViewAlert: UIViewRepresentable {
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
    
    func makeUIView(context: Context) -> UIView {
        AlertView()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        let alert = uiView as? AlertView
        alert?.tintColor = accentColor
        alert?.backgroundView.backgroundColor = backgroundColor
        alert?.backgroundView.layer.cornerRadius = backgroundRadius
        alert?.iconImageView.image = icon
        alert?.titleLabel.text = title
        alert?.messageLabel.text = message
        alert?.agreeButton.setTitle(agreeTitle, for: .normal)
        alert?.agreeButton.layer.cornerRadius = agreeCornerRadius
        alert?.cancelButton.setTitle(cancelTitle, for: .normal)
        alert?.alertBottomAnimation = bottomAnimation
    }
}


