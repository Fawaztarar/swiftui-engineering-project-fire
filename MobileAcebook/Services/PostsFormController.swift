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
    let publicID = UUID()
    
   
    
    func executeUpload(messagetoSave: String, tokenUse: String, completion: @escaping(Result<PostData, APIError>) -> Void) {
        
        
        do {
            // post request to given postposts POST request
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
//            request.allHTTPHeaderFields = headers
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("Bearer \(tokenUse)", forHTTPHeaderField: "Authorization")
            request.httpBody = try JSONEncoder().encode(PostData(message: messagetoSave, publicID: UUID()))
            print("request", request)
            
            
           
            
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
            
