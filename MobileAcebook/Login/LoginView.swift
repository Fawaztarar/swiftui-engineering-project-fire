//
//  LoginView.swift
//  MobileAcebook
//
//  Created by Marcela Moreti on 20/02/2024.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @State var isLoggedIn = false
    @State var loginError = false
    @ObservedObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        
        NavigationView {
            NavigationStack{
                ZStack(alignment: .center) {
                    Color("backgroudBlue")
                    
                    VStack(spacing: 80) {
                        Spacer()
                            .frame(height: 10)
                        
                        Image("acebookLogo")
                            .resizable()
                            .frame(width: 100, height: 100)
                        
                        
                        VStack(spacing: 30){
                            
                            
                            
                            VStack {
                                
                                ZStack {
                                    Rectangle()
                                        .fill(Color("darkBlueButton"))
                                        .frame(width: 365, height: 60)
                                        .cornerRadius(10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color("grayBorder"), lineWidth: 1)
                                        )
                                    
                                    TextField("Email", text: $email)
                                        .textFieldStyle(PlainTextFieldStyle())
                                        .colorScheme(.dark)
                                        .keyboardType(.emailAddress)
                                        .frame(width: 320, height: 60)
                                        .textInputAutocapitalization(.never)
                                        .foregroundColor(Color("white"))
                                        .padding(.horizontal, 10)
                                }
                                
                                
                                ZStack {
                                    Rectangle()
                                        .fill(Color("darkBlueButton"))
                                        .frame(width: 365, height: 60)
                                        .cornerRadius(10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color("grayBorder"), lineWidth: 1)
                                        )
                                    SecureField("Password", text: $password)
                                        .textFieldStyle(PlainTextFieldStyle())
                                        .colorScheme(.dark)
                                        .textInputAutocapitalization(.never)
                                        .frame(width: 320, height: 40)
                                        .foregroundColor(Color("white"))
                                        .padding(.horizontal, 10)
                                }
                                
                                NavigationLink(destination: Text("Form to refresh password")){
                                    Text("Forgotten password?")
                                    
                                }
                                
                                
                            }
                            
                            VStack(spacing: 170) {
                                
                                //                          navigation just work if isActive = true(isLoggedIn)
                                NavigationLink(isActive: $isLoggedIn) {
                                    Text("Successful")
                                    
                                    
                                } label: {
                                    VStack {
                                        Button {
                                            Task {
                                                
                                                let loginResult = await loginViewModel.login(email: email, password: password)
                                                
                                                if loginResult {
                                                    isLoggedIn = true
                                                    
                                                } else {
                                                    loginError = true
                                                }
                                                
                                            }
                                        } label: {
                                            Text("Log in")
                                                .frame(width: 300, height: 20)
                                                .foregroundColor(Color("white"))
                                                .font(.title2)
                                                .padding()
                                                .background(Color("facebookBlue"))
                                                .clipShape(Capsule())
                                        }
                                        
                                    }
                                    .navigationDestination(isPresented: $isLoggedIn){
                                        Text("Logado")
                                        
                                    }
                                    
                                }
                                NavigationLink(destination: SignUpPageView()) {
                                    Text("Create new account")
                                        .frame(width: 300, height: 20)
                                        .foregroundColor(Color("facebookBlue"))
                                        .font(.title2)
                                        .padding()
                                        .background(Color("backgroudBlue"))
                                        .clipShape(Capsule())
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 50)
                                                .stroke(Color("facebookBlue"), lineWidth: 1)
                                        )
                                    
                                    
                                }
                            }
                            
                        }
                        
                    }
                    .ignoresSafeArea()
                }
                
                .navigationBarHidden(true)
                .alert(isPresented: $loginError) {
                    Alert(title: Text("Error"),
                          message: Text("Log in error. Try again"),
                          dismissButton: .default(Text("Ok")))
                }
                
            }
            
        }
    }
    
    
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
        }
    }
    
    
    
}
