//
//  likePost.swift
//  MobileAcebook
//
//  Created by Fawaz Tarar on 22/02/2024.
//

import Foundation
func likePost(postId: UUID) {
    guard let url = URL(string: "http://127.0.0.1:8080/posts/\(postId)/like") else { return }

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    // Include any necessary headers, such as authentication tokens

    URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data, error == nil else {
            print(error?.localizedDescription ?? "Unknown error")
            return
        }
        // Handle the response
        // You might want to decode a JSON response and update the UI accordingly
    }.resume()
}
