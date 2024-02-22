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
    
    var body: some View {
        NavigationView {
            HStack {
                
                List {
                    TextField("What are you thinking? ...", text: $message)
            
                    
                }
                    
                    
                    Button(action: {
                        Task {
                            do {
                                postViewModel.executeUpload(messagetoSave: message) { result in
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
                }
            }
        
            }
        }
    

    struct FeedView_Previews: PreviewProvider {
        static var previews: some View {
            FeedView()
        }
    }
