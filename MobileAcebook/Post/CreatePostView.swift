
//
//  CreatePostView.swift
//  Acebook
//
//  Created by Fawaz Tarar on 18/02/2024.
//

import Foundation
import SwiftUI

struct CreatePostView: View {
    @State private var postText: String = ""
    
    var body: some View {
        VStack {
            // Top bar including the 'X' close button, 'Create post' title, and 'Next' button
            createPostTopBar()
            
            // User profile and post privacy settings
            userProfileAndSettings()
            
            // Text editor for the post content
            postContentEditor()
            
            // Divider to separate text editor from post options
            Divider().background(Color.white)
            
            // Post options like adding a photo/video, tagging people, etc.
            postOptions()
            
            Spacer()
        }
        .background(Color.black) // Background color set to black
               .foregroundColor(.white) // All text color set to white
    }
    
    @ViewBuilder
    private func createPostTopBar() -> some View {
        HStack {
            Button(action: {
                // Close action
            }) {
                Image(systemName: "xmark")
            }
            .padding(.leading, 10)
            
            Spacer()
            
            Text("Create post")
                .bold()
            
            Spacer()
            
            Button(action: {
                // Next action
            }) {
                Text("Submit")
                    .bold()
            }
            .padding(.trailing, 10)
        }
        .padding(.vertical, 10)
    }
    
    @ViewBuilder
    private func userProfileAndSettings() -> some View {
        HStack {
            Image("profile4") // Replace with your profile image asset
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            Text("Tarar Fawaz") // Replace with dynamic user name
                .fontWeight(.semibold)
            
            Spacer()
            
            HStack(spacing: 5) {
                
                
                Label("Album", systemImage: "photo.on.rectangle")
                Image(systemName: "location.slash.fill")
            }
            .padding(.trailing, 10)
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private func postContentEditor() -> some View {
        TextField("What's on your mind?", text: $postText)
            .padding(4) // Padding inside the TextEditor
            .frame(minHeight: 100) // Minimum height to show multiple lines
            .background(Color(.secondarySystemBackground))
            .cornerRadius(8)
            .padding(.horizontal) // Padding outside the TextEditor
    }


    }
    
    @ViewBuilder
    private func postOptions() -> some View {
        VStack(spacing: 15) {
            OptionButton(iconName: "camera", optionName: "Photo/video")
            
            OptionButton(iconName: "smiley", optionName: "Feeling/activity")
            OptionButton(iconName: "mappin", optionName: "Check in")
            
            
        }
        .padding(.horizontal)
    }
    
@ViewBuilder
private func OptionButton(iconName: String, optionName: String) -> some View {
    Button(action: {
        // Implement action for each button
    }) {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(.white) // Icon color set to white
                .imageScale(.large)
            Text(optionName)
                .foregroundColor(.white) // Text color set to white
            Spacer()
        }
        .padding(.vertical, 10)
        .background(Color.white.opacity(0.1)) // Slightly transparent white background
        .border(Color.white, width: 1) // White border
        .cornerRadius(10)
    }
}


// Extension to add placeholder functionality to TextEditor
extension View {
    @ViewBuilder
    func placeholder<Content: View>(
        _ show: Bool,
        alignment: Alignment = .topLeading,
        @ViewBuilder _ content: () -> Content
    ) -> some View {
        ZStack(alignment: alignment) {
            if show {
                content()
            }
            self
        }
    }
}

struct CreatePostView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostView()
    }
}
