//
//  ContentView.swift
//  SwiftUIExamples
//
//  Created by Giada Ciotola on 28/09/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        Color.blue
            .ignoresSafeArea(.all)
            .overlay(
                VStack {
                    Button {
                        viewModel.showAlert()
                    } label: {
                        Text("Show Alert")
                    }.font(.system(size: 17, weight: .semibold, design: .default))
                        .foregroundColor(.white)
                })
    }
}

#Preview {
    ContentView()
}
