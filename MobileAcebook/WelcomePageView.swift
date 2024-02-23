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
                
                
                NavigationLink("Sign Up Page", destination: SignUpPageView())
                
                
                NavigationLink("Log In", destination: LoginView())
                    .padding()
                    
                
                NavigationLink("Post Feed View", destination: PostFeedView())
                    
                
                NavigationLink("PostView", destination: FacebookPostView())
                    
                
                NavigationLink("Create PostView", destination: CreatePostView())
                
                
                NavigationLink("UserProfile View", destination: UserProfileView())
                    
                
                

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
