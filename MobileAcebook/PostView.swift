//
//  ContentView.swift
//  MobileAcebook
//
//  Created by Katie-Rose Anthonisz on 21/02/2024.
//

import Foundation
import SwiftUI
import UIKit




struct FeedView: View {
    @State var message = ""
    @State var image = ""
    @ObservedObject var postViewModel = PostViewModel()
    @ObservedObject var tokenManager: TokenManager
    
    init(tokenManager: TokenManager) {
        self.tokenManager = tokenManager
    }
    
    var body: some View {
        NavigationView {
            HStack {
                TextField("What are you thinking? ...", text: $message)
                    .position(x: 150, y: 80)
                
                Button(action: {
                    Task {
                        do {
                            guard let token = tokenManager.token?.token else {
                                print("Token not found")
                                return
                                
                            }
                            
                            postViewModel.executeUpload(messagetoSave: message, tokenUse: token) { result in
                                switch result {
                                case .success(let message):
                                    print("The following message has been sent: \(message.message)")
                                case .failure(let error):
                                    print("An error occurred: \(error)")
                                }
                            }
                        }
                    }
                }) {
                    Text("Post")
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.small)
                .position(x: 150, y: 20)
            }
        }
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        let tokenManager = TokenManager()
        FeedView(tokenManager: tokenManager)
    }
}
