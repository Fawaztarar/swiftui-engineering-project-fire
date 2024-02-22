//
//  PostMessageForm.swift
//  MobileAcebook
//
//  Created by Katie-Rose Anthonisz on 20/02/2024.
//

import Foundation
import SwiftUI



//struct MessageItem: Identifiable {
//    var id = UUID()
//    let message: String
//    let image: String // Assuming image is a URL string
//    let createdBy: String // Assuming createdBy is the user ID
//    let likes: [String] // Assuming likes is an array of user IDs
//    let comments: Int
//
//}



//class PostMessageController: UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
    //    @Binding var newMessage = String
    //    @State private var messageItems: [MessageItem] = []
    
//    @IBAction func postMessage(_ sender: Any) {
//        let alertController = UIAlertController(title: "Create a post", message: "What are you thinking", preferredStyle: .alert)
//        alertController.addTextField { textField in
//            textField.placeholder = "Your message..."
//        }
//        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//        alertController.addAction(UIAlertAction(title: "Post", style: .default, handler: { action in
//            guard let text = alertController.textFields?.first?.text else {print("No text available");
//                return}
//            
//            let message = Message(message: text, image: "default")
//            
//            let postRequest = APIRequest()
//            
//            postRequest.executeUpload(message, completion: { result in
//                switch result {
//                case .success(let message):
//                    print("The following message has been sent: \(message.message)")
//                case .failure(let error):
//                    print("An error occured \(error)")
//                }
//            })
//        }))
//        self.present(alertController, animated: true)
//    }
//}

    
    
//    
//    var body: some View {
//        NavigationView {
//            List {
//                HStack{
//                    TextField("What are you thinking?", text: $newMessage)
//                    Button(/*action: executeUpload) */{
//                        Text("Post"))
//
//                    }
//                }
//            }
//        }
//        
//    }
//    }
    
    
    
//}
//#if DEBUG
//struct PostMessageView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostMessageView()
//    }
//}
//#endif


