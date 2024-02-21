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
                NavigationLink("Log In", destination: LoginView())
                
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

