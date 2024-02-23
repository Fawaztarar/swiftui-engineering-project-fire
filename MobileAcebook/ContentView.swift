//
//  ContentView.swift
//  Acebook
//
//  Created by Fawaz Tarar on 20/02/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("Sign Up", destination: SignUpView())
                
                NavigationLink("Sign Up Page", destination: SignUpPageView())
                
                NavigationLink("Log In", destination: LoginView())
                NavigationLink("POST FEED VIEW", destination: PostFeedView())
                
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

