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
                    .padding()
                Form {
                    ZStack {
                        Rectangle()
                            .fill(Color(hex: "#1E1D23"))
                            .frame(width:365, height: 60)
                            .cornerRadius(10)
                            //.stroke(Color.pink)
                         TextField("Please Enter your username", text: $username)
                             .textInputAutocapitalization(.never)
                             .frame(width: 320, height: 40)
                             // .foregroundColor(Color.white)
                             .padding(.horizontal, 10)
                             .multilineTextAlignment(.center)
                    }
                }
                .scrollContentBackground(.hidden)
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
                         TextField("Password", text: $password)
                             .keyboardType(.emailAddress)
                             .textInputAutocapitalization(.never)
                             .frame(width: 320, height: 40)
                             .foregroundColor(Color("backgroudBlue"))
                             .padding(.horizontal, 10)
                     }.offset(y: -90)
*/

