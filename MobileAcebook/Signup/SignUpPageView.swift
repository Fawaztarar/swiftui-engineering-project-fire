//
//  SignUpPageView.swift
//  MobileAcebook
//
//  Created by Jonny Brownrigg on 20/02/2024.
//

import SwiftUI

struct SignUpPageView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("backgroundBlue")
                
                VStack (spacing: 80){
                    Spacer()
                        .frame(height: 10)
                    
                    Image("acebookLogo")
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    VStack(spacing: 30) {
                        
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
                                
                                TextField("What is your email?", text: $email)
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
                                SecureField("What is your Password", text: $password)
                                    .textFieldStyle(PlainTextFieldStyle())
                                        .colorScheme(.dark)
                                    .textInputAutocapitalization(.never)
                                    .frame(width: 320, height: 40)
                                    .foregroundColor(Color("white"))
                                    .padding(.horizontal, 10)
                            }
                        }
                    }
                    
                   .listStyle(PlainListStyle())
                    .scrollContentBackground(.hidden)
                    
                    Button("Add avatar") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                    .padding(.bottom, 100)
                    
                    Button("Sign up without and avatar") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                    .padding(.bottom, 100)
                }
               
            }
        }
    }
}

#Preview {
    SignUpPageView()
}
