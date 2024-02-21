//
//  WelcomePageView.swift
//  MobileAcebook
//
//  Created by Josué Estévez Fernández on 30/09/2023.
//

import SwiftUI

struct WelcomePageView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()

                Text("Welcome to Acebook")
                    .font(.largeTitle)
                    .padding(.bottom, 20)
                    .accessibilityIdentifier("welcomeText")

                Spacer()

                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .accessibilityIdentifier("logo")
                
                Spacer()

                NavigationLink("Sign Up", destination: SignUpView())
                    .padding()
                
                NavigationLink("Log In", destination: LoginView())
                    .padding()

                Spacer()
            }
        }
    }
}

struct WelcomePageView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePageView()
    }
}
