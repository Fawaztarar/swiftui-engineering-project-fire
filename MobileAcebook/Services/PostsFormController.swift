//
//  PostsService.swift
//  MobileAcebook
//
//  Created by Katie-Rose Anthonisz on 20/02/2024.
//

import Foundation
import UIKit




enum APIError: Error {
    case responseProblem
    case decodingProblem
    case encodingProblem
}


class PostViewModel: ObservableObject {
    
    let url = URL(string: "http://127.0.0.1:8080/posts")!
    
    func executeUpload(messagetoSave: String,  completion: @escaping(Result<PostData, APIError>) -> Void) {
        
        do {
            // post request to given postposts POST request
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try JSONEncoder().encode(messagetoSave)
            print("message", request)
            
            let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let jsonData = data else {
                    completion(.failure(.responseProblem))
                    return
                }
                
                do {
                    // catch errors from JSON decoder
                    let messageData = try JSONDecoder().decode(PostData.self, from: jsonData)
                    completion(.success(messageData))
                } catch {
                    completion(.failure(.decodingProblem))
                }
                
            }
            task.resume()
        } catch {
            completion(.failure(.encodingProblem))
        }
        
    }
}
            
            
//            guard let jsonData = serializeData(postData: postData) else {
//            print("failed ro serialize")
//            return
//        }
// 
//            var request = URLRequest(url: url)
//            request.httpMethod = "POST"
//            request.httpBody = jsonData
//            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//    
//            let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
//                if let error = error {
//                    print("Error: \(error)")
//                    return
//                }
//                if let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode){
//                    print("Status code: \(httpResponse.statusCode)")
//                }else {
//                    print("Invalid response")
//                    return
//                }
//            
//            }
//            // call resume() on the URLSessionDataTask instance to execute it
//            task.resume()
//        }
////    override func viewDidLoad() {
////        super.viewDidLoad()
////        self.navigationItem.rightBarButtonItem =
////        UIBarButtonItem(title: "Post", style:.plain, target: self, action: #selector(executeUpload))
////    }
//        
//}
//
