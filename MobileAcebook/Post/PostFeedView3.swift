//
//  PostFeedView3.swift
//  MobileAcebook
//
//  Created by Fawaz Tarar on 21/02/2024.
//

import Foundation

import SwiftUI

struct PostFeedView3: View {
    // Assuming an array of posts is available
    @State var posts: [Post] = [Post(username: "John Doe", content: "Hello, SwiftUI!", profilePicture: "profile1")]

    var body: some View {
        VStack(spacing: 0) {
            TopBarView3()

            ScrollView {
                VStack(spacing: 10) {
                    StatusUpdateView3()

                    ForEach(posts) { post in
                        FacebookPostView3(post: post)
                    }
                }
                .padding()
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .foregroundColor(.white)
    }
}

// Other structs (TopBarView3, StatusUpdateView3) remain unchanged
