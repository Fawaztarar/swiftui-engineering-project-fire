//
//  SignupViewModel.swift
//  MobileAcebook
//
//  Created by Jonny Brownrigg on 21/02/2024.
//

import Foundation

class SignupViewModel: ObservableObject {
    
    func createUser(email: String, password: String) async -> Bool {
        guard let url = URL(string: "http://127.0.0.1:8080/users") else {
            return false
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // serialse signupUserModel in JSON
        guard let userSignupEncoded = try?JSONEncoder().encode(SignupUserModel(email: email, password: password)) else {
            return false
        }
        request.httpBody = userSignupEncoded
        
        guard let response = try? await URLSession.shared.data(for: request) else {
            return false
        }
        
        if let httpResponse = response.1 as? HTTPURLResponse {
            if httpResponse.statusCode != 201 {
                return false
            }
        }
        
        // if successful return true
        return true
    }
}
