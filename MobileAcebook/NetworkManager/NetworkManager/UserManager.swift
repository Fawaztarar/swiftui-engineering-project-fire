//
//  UserManager.swift
//  Acebook
//
//  Created by Fawaz Tarar on 15/02/2024.
//

//import Foundation
//class UserManager: ObservableObject {
//    @Published var isAuthenticated = false
//
//    // Simulated user database
//    private let registeredUsers = [
//        User(username: "john", password: "123"),
//        User(username: "jane", password: "456")
//    ]
//    
//    func login(username: String, password: String) {
//        // Check if the user exists in the registered users
//        if registeredUsers.contains(where: { $0.username == username && $0.password == password }) {
//            isAuthenticated = true
//        } else {
//            isAuthenticated = false
//            // Handle login failure, e.g., show an error message
//        }
//    }
//
//    func logout() {
//        isAuthenticated = false
//    }
//}
