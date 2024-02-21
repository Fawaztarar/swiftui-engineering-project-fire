//
//  signUpView.swift
//  MobileAcebook
//
//  Created by Fawaz Tarar on 21/02/2024.
//

import Foundation
import SwiftUI

struct SignUpView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showingLogin = false
    
    var body: some View {
        NavigationView {
            VStack {
                Image("BG") // Placeholder for your illustration
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                Text("Create an account to connect with friends, family, and communities of people who share your interests.")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding()
                
                NavigationLink(destination: NameEntryView(firstName: $firstName, lastName: $lastName)) {
                    Text("Get started")
                    
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    // This action is optional if you don't need to perform any additional actions when the button is tapped
                }) {
                    NavigationLink(destination: LoginView()) {
                        Text("I already have an account")
                    }
                    .padding()
                }
                
                Spacer()
                
                HStack {
                    Text("Meta")
                        .font(.caption)
                    // Your branding image or text here
                }
                .padding(.bottom, 20)
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue.opacity(0.3)]), startPoint: .top, endPoint: .bottom))
            .ignoresSafeArea()
        }
    }
}

struct NameEntryView: View {
    @Binding var firstName: String
    @Binding var lastName: String
    @State private var email: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("What's your name?")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            TextField("First name", text: $firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Last name", text: $lastName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            NavigationLink(destination: EmailEntryView(email: $email)) {
                Text("Next")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .navigationTitle("Sign Up")
        .navigationBarBackButtonHidden(true)
    }
}

struct EmailEntryView: View {
    @Binding var email: String
    @State private var password: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("What's your email?")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            NavigationLink(destination: PasswordEntryView(password: $password)) {
                Text("Next")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .navigationTitle("Email")
        .navigationBarBackButtonHidden(true)
    }
}

struct PasswordEntryView: View {
    @Binding var password: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Create a password")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Sign Up") {
                // Implement sign up action
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
            .padding(.horizontal)
            
            Spacer()
        }
        .navigationTitle("Password")
        .navigationBarBackButtonHidden(true)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

