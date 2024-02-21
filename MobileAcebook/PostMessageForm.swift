//
//  PostMessageForm.swift
//  MobileAcebook
//
//  Created by Katie-Rose Anthonisz on 20/02/2024.
//

import Foundation
import SwiftUI
import UIKit


struct MessageItem: Identifiable {
    var id = UUID()
    let message: String
    let image: String // Assuming image is a URL string
    let createdBy: String // Assuming createdBy is the user ID
    let likes: [String] // Assuming likes is an array of user IDs
    let comments: Int

}



struct PostMessageView: View {
    @Binding var newMessage = String
    @State private var messageItems: [MessageItem] = []
    weak var delegate: PostMessageDelegate?
    
    
    
    var body: some View {
        NavigationView {
            List {
                HStack{
                    TextField("What are you thinking?", text: $newMessage)
                    Button(action: executeUpload) {
                        Text("Post")
                        
                    }
                }
            }
        }
        
    }
    private func executeUpload() {
        delegate?.postMessage(newMessage)
    }
    
    
    
}
#if DEBUG
struct PostMessageView_Previews: PreviewProvider {
    static var previews: some View {
        PostMessageView()
    }
}
#endif


