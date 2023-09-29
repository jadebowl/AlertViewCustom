//
//  ContentView.swift
//  SwiftUIExamples
//
//  Created by Giada Ciotola on 28/09/23.
//

import SwiftUI
import CustomAlert

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
                    .overlay(showingSheet ? AlertViewRepresentable(accentColor: .systemBlue,
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
