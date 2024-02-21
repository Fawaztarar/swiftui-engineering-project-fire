//
//  LoginView.swift
//  Acebook
//
//  Created by Fawaz Tarar on 19/02/2024.
//


import SwiftUI

struct LoginView2: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoginSuccessful = true // Assuming login is successful by default
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("xlogo") // Your Facebook logo image asset
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 60)
            Spacer()
            
            VStack {
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 50)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 50)
                
                Button("Log In") {
                    loginAction()
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
                .padding(.horizontal, 50)
                
                if !isLoginSuccessful {
                    Text("Login failed. Please check your credentials.")
                        .foregroundColor(.red)
                        .padding()
                }
            }
            
            Button("Forget password?") {
                // Handle log into another account action
            }
            .padding()
            
            NavigationLink(destination: UserProfileView()) {
                Text("Create new account")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal, 50)
                
            }
            
            Spacer()
            
            HStack {
                Text("Meta")
                    .font(.caption)
                Image("metaLogo") // Your Meta logo image asset
            }
            .padding(.bottom, 20)
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue.opacity(0.3)]), startPoint: .top, endPoint: .bottom))
        .ignoresSafeArea()
    }
    
    func loginAction() {
        let networkManager = NetworkManager.shared
        networkManager.request(endpoint: "tokens", method: NetworkManager.HTTPMethod.POST, body: nil) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    if let data = data,
                       let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                       let token = json["token"] as? String {
                        self.isLoginSuccessful = true
                        // Navigate to the next screen or update the UI accordingly
                    } else {
                        self.isLoginSuccessful = false
                        // Show error message or handle login failure
                    }
                case .failure(_):
                    self.isLoginSuccessful = false
                    // Show error message or handle login failure
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
