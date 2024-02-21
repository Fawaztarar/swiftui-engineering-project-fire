//
//  SignUpPageView.swift
//  MobileAcebook
//
//  Created by Jonny Brownrigg on 20/02/2024.
//

import Foundation
import SwiftUI
import UIKit

struct SignUpPageView: View {
    let backgroundColor = Color(hex: "#1E1D23")
    @State private var username = ""
    
    var body: some View {
        ZStack {
            Color(hex: "#1E1D23")
                .ignoresSafeArea()
            VStack {
                Image("acebookLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width:85)
                    .padding(40)
               List {
                    ZStack {
                        Rectangle()
                            .fill(Color(hex: "#142C35"))
                            .frame(width: 365, height: 80)
                            .cornerRadius(10)
                         TextField("Please Enter your username", text: $username)
                             .textInputAutocapitalization(.never)
                             .frame(width: 320, height: 40)
                             .padding(.horizontal, 10)
                             .multilineTextAlignment(.center)
                             .foregroundColor(Color.white)
                    }
                    .listRowBackground(Color(hex: "#1E1D23"))
                    .padding(10)
                   ZStack {
                       Rectangle()
                           .fill(Color(hex: "#142C35"))
                           .frame(width: 365, height: 80)
                           .cornerRadius(10)
                       TextField("Please Enter your username", text: $username)
                           .textInputAutocapitalization(.never)
                           .frame(width: 320, height: 40)
                           .padding(.horizontal, 10)
                           .multilineTextAlignment(.center)
                           .foregroundColor(Color.white)
                   }
                    .listRowBackground(Color(hex: "#1E1D23"))
                    .padding(10)
                   ZStack {
                       Rectangle()
                           .fill(Color(hex: "#142C35"))
                           .frame(width: 365, height: 80)
                           .cornerRadius(10)
                       TextField("Please Enter your username", text: $username)
                           .textInputAutocapitalization(.never)
                           .frame(width: 320, height: 40)
                           .padding(.horizontal, 10)
                           .multilineTextAlignment(.center)
                           .foregroundColor(Color.white)
                   }
                    .listRowBackground(Color(hex: "#1E1D23"))
                    .padding()
                }
               .listStyle(PlainListStyle())
                .scrollContentBackground(.hidden)
                Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .padding(5)
                Button("Sign up without and avatar") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .padding(.bottom, 100)
            }
           
        }
    }
}

#Preview {
    SignUpPageView()
}
/*
 ZStack {
                         Rectangle()
                             .fill(Color("white"))
                             .frame(width: 365, height: 60)
                             .cornerRadius(10)
                         TextField("Email", text: $email)
                             .frame(width: 320, height: 60)
                             .foregroundColor(Color("backgroudBlue"))
                             .padding(.horizontal, 10)
                     }.offset(y: -90)
                     
                     ZStack {
                         Rectangle()
                             .fill(Color("white"))
                             .frame(width: 365, height: 60)
                             .cornerRadius(10)
                         TextField("Password", text: $password)
                             .keyboardType(.emailAddress)
                             .textInputAutocapitalization(.never)
                             .frame(width: 320, height: 40)
                             .foregroundColor(Color("backgroudBlue"))
                             .padding(.horizontal, 10)
                     }.offset(y: -90)*/

