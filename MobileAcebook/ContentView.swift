//
//  ContentView.swift
//  MobileAcebook
//
//  Created by Katie-Rose Anthonisz on 21/02/2024.
//

import Foundation
import SwiftUI
import UIKit


struct ContentView: View {
    @State private var messageText = ""

    var body: some View {
        VStack {
            PostMessageView(newMessage: $messageText)
        }
    }
}
