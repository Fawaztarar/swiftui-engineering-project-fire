//
//  TokenStorage.swift
//  Acebook
//
//  Created by Fawaz Tarar on 19/02/2024.
//

import Foundation


class TokenStorage {
    static let shared = TokenStorage()
    
    private let key = "authToken"
    private let defaults = UserDefaults.standard
    
    // Function to save authentication token
    func saveToken(token: String) {
        defaults.set(token, forKey: key)
    }
    
    // Function to retrieve authentication token
    func getToken() -> String? {
        return defaults.string(forKey: key)
    }
    
    // Function to clear authentication token
    func clearToken() {
        defaults.removeObject(forKey: key)
    }
}
