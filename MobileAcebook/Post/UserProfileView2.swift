//
//  UserProfileView2.swift
//  MobileAcebook
//
//  Created by Fawaz Tarar on 21/02/2024.
//

import Foundation
import SwiftUI

struct UserProfileView: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading) {
                    Image("cover") // Placeholder for cover photo
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipped()
                    
                    HStack {
                        Image("profile1") // Placeholder for profile photo
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 10)
                            .padding(.leading, 12)
                        
                        Spacer()
                        
                        Button(action: {
                            // Edit profile action
                        }) {
                            Text("Edit")
                                .font(.headline)
                                .foregroundColor(.blue)
                                .padding(.horizontal)
                        }
                        .frame(height: 30)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.blue, lineWidth: 2)
                        )
                        .padding(.trailing, 12)
                    }
                    .offset(y: -60)
                    .padding(.bottom, -60)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Tarar Fawaz")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.leading, 12)
                        
                        Text("1.6K followers · 3.4K following")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.leading, 12)
                        
                        HStack {
                            Spacer()
                            ActionButton(title: "Create reel", color: .blue)
                            Spacer()
                            ActionButton(title: "Edit Profile", color: .gray)
                            Spacer()
                        }
                        .padding(.vertical)
                    }
                    
                    ProfileTabsView()
                    
                    DetailsView()
                }
            }
        }
    }
}

struct ActionButton: View {
    var title: String
    var color: Color
    
    var body: some View {
        Button(action: {
            // Action
        }) {
            Text(title)
                .foregroundColor(.white)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .background(color)
        .cornerRadius(5)
    }
}

struct ProfileTabsView: View {
    var body: some View {
        HStack {
            Spacer()
            ProfileTab(title: "Posts")
            Spacer()
            ProfileTab(title: "About")
            Spacer()
            ProfileTab(title: "Photos")
            Spacer()
            ProfileTab(title: "More")
            Spacer()
        }
        .padding()
        .background(Color(white: 0.1))
    }
}

struct ProfileTab: View {
    var title: String
    
    var body: some View {
        Button(title) {
            // Action
        }
        .foregroundColor(.white)
    }
}

struct DetailsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Details")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.leading, 12)
            
            HStack {
                Image(systemName: "info.circle")
                    .foregroundColor(.gray)
                Text("Profile · Digital creator")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.leading, 12)
            
            HStack {
                Image(systemName: "info.circle")
                    .foregroundColor(.gray)
                Text("See your About info")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.leading, 12)
        }
        .padding(.vertical)
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
