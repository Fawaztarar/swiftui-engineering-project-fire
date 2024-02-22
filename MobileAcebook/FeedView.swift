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
    @State var token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjVkNzJhNDY2ZjI3YTkwMTk1NDg3YmE5IiwiaWF0IjoxNzA4NjEwODc4LCJleHAiOjE3MDg2MTQ0Nzh9.n2jErRq61jqVgfVdpHTkSDaRVxmknbR2qslnewh-i5Q"
    
    var body: some View {
        NavigationView {
            HStack {
                
                
                    TextField("What are you thinking? ...", text: $message)
                    .position(x: 150, y: 80)

    
                    
                    
                    Button(action: {
                        Task {
                            do {
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
        FeedView()
    }
}
