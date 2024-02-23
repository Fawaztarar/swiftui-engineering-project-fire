//
//  AuthenticationController.swift
//  MobileAcebook
//
//  Created by Katie-Rose Anthonisz on 23/02/2024.
//

import Foundation

class TokenManager: ObservableObject {
    @Published var token: TokenModel?
    
    func saveToken(token: TokenModel) {
        let tokenStore = UserDefaults.standard
        guard let encoded = try? JSONEncoder().encode(token) else {return}
        tokenStore.setValue(encoded, forKey: "token")
    }
    
    func getToken() {
        if let data = UserDefaults.standard.data(forKey: "token"),
            let token = try? JSONDecoder().decode(TokenModel.self, from: data) {
            self.token = token
        }
    }
}
