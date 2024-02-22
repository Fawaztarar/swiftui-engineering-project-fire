//
//  LoginViewModel.swift
//  MobileAcebook
//
//  Created by Marcela Moreti on 20/02/2024.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    
    func login(email: String, password: String) async -> Bool {

        guard let url = URL(string: "http://127.0.0.1:8080/tokens") else {
            return false
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let userEncoded = try?JSONEncoder().encode(LoginUserModel(email: email, password: password)) else {
            return false
        }

        request.httpBody = userEncoded

        guard let response = try? await URLSession.shared.data(for: request) else {
            return false
        }

        guard let token = try? JSONDecoder().decode(TokenModel.self, from: response.0) else{
            return false
        }

        print(token.token)
        saveToken(token: token)
        return true
        
    }
    
    func saveToken(token: TokenModel) {
        let tokenStore = UserDefaults.standard
        guard let encoded = try? JSONEncoder().encode(token) else {return}
        tokenStore.setValue(encoded, forKey: "token")
    }
}


