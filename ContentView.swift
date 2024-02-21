//
//  ContentView.swift
//  MobileAcebook
//
//  Created by Katie-Rose Anthonisz on 21/02/2024.
//

import Foundation
import SwiftUI
import UIKit

struct PostMessageControllerWrapper: UIViewControllerRepresentable {
    var messageText: String

    func makeUIViewController(context: Context) -> PostMessageController {
        let viewController = PostMessageController()
        return viewController
    }

    func updateUIViewController(_ uiViewController: PostMessageController, context: Context) {
    }
}
struct ContentView: View {
    @State private var showingAlert = false
    @State private var name = ""

    var body: some View {
        VStack {
            Button("Create a Post") {
                showingAlert = true
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Alert"), message: Text("This is an alert message"), dismissButton: .default(Text("OK")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
