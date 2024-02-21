//
//  AuthenticationService.swift
//  Acebook
//
//  Created by Fawaz Tarar on 19/02/2024.
//

import Foundation


class AuthenticationService: AuthenticationServiceProtocol {
    private let baseURL = "http://127.0.0.1:8080" // Your backend base URL
    
    func signUp(email: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
        // Prepare the request URL
        let signUpURL = URL(string: "\(baseURL)/users")!
        
        // Prepare the request body
        let requestBody = ["email": email, "password": password]
        let jsonData = try! JSONSerialization.data(withJSONObject: requestBody)
        
        // Create the HTTP request
        var request = URLRequest(url: signUpURL)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Perform the request
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            // Check for response status code
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 500
                completion(.failure(NSError(domain: "HTTPError", code: statusCode, userInfo: nil)))
                return
            }
            
            // Signup successful, parse the response
            if httpResponse.statusCode == 201 {
                completion(.success("User signed up successfully"))
            } else {
                completion(.failure(NSError(domain: "SignupError", code: 0, userInfo: nil)))
            }
        }.resume()
    }
    
    func login(email: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
        // Prepare the request URL
        let loginURL = URL(string: "\(baseURL)/tokens")!
        
        // Prepare the request body
        let requestBody = ["email": email, "password": password]
        let jsonData = try! JSONSerialization.data(withJSONObject: requestBody)
        
        // Create the HTTP request
        var request = URLRequest(url: loginURL)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Perform the request
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            // Check for response status code
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 500
                completion(.failure(NSError(domain: "HTTPError", code: statusCode, userInfo: nil)))
                return
            }
            
            // Login successful, parse the response
            if let data = data,
               let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
               let token = json["token"] as? String {
                completion(.success(token))
            } else {
                completion(.failure(NSError(domain: "LoginError", code: 0, userInfo: nil)))
            }
        }.resume()
    }
}

// MARK: - Token Parsing
   
   private func parseToken(from data: Data) -> String? {
       guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
             let token = json["token"] as? String else {
           return nil
       }
       return token
   }
   
   // MARK: - Message Parsing
   
   private func parseMessage(from data: Data) -> String? {
       guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
             let message = json["message"] as? String else {
           return nil
       }
       return message
   }

