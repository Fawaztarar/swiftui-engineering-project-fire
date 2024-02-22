//
//  PostViewModel.swift
//  MobileAcebook
//
//  Created by Reece Owen on 22/02/2024.
//

import Foundation

struct Posts: Decodable {
    var id = UUID()
    var username: String
    var image: String
    var caption: String
    var likes: Int = 0
    var comments: [String] = []
}

class PostViewModel: ObservableObject {
    @Published var posts: [Posts] = []
    
    func post() {
        
        guard let url = URL(string: "http://127.0.0.1:8080/posts") else {
            return
        }
        var request = URLRequest(url: url)
         request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            if let data = data {
                do {
                    let decodedPosts = try JSONDecoder().decode([Posts].self, from: data)
                    DispatchQueue.main.async {
                        self.posts = decodedPosts
                        print("Updated posts: \(self.posts)")}
                } catch {
                    print("Error Decoding JSON: \(error)")
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }
        
        task.resume()
    }
}
