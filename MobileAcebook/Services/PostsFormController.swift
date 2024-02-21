//
//  PostsService.swift
//  MobileAcebook
//
//  Created by Katie-Rose Anthonisz on 20/02/2024.
//

import Foundation
import UIKit


struct PostData: Codable {
    let message: String
    let image: String // Assuming image is a URL string
    let createdBy: String // Assuming createdBy is the user ID
    let likes: [String] // Assuming likes is an array of user IDs
    let comments: Int
}




class PostsFormController {
   
    
    let url = URL(string: "http://127.0.0.1:8080/posts")!
   

    private func serializeData(postData: PostData) -> Data? {
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(postData)
            return jsonData
        } catch {
            print("Error encoding data: \(error.localizedDescription)")
            return nil
        }
    }
    
    func executeUpload(postData: PostData) {
        guard let jsonData = serializeData(postData: postData) else {
            print("failed ro serialize")
            return
        }
 
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = jsonData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
            let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                    return
                }
                if let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode){
                    print("Status code: \(httpResponse.statusCode)")
                }else {
                    print("Invalid response")
                    return
                }
            
            }
            // call resume() on the URLSessionDataTask instance to execute it
            task.resume()
        }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.navigationItem.rightBarButtonItem =
//        UIBarButtonItem(title: "Post", style:.plain, target: self, action: #selector(executeUpload))
//    }
        
}

