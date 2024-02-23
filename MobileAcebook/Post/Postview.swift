
import Foundation
//
//  PostsView.swift
//  MobileAcebook
//
//  Created by Reece Owen on 20/02/2024.
//

import SwiftUI

// Model for a Post
struct Post: Identifiable {
    var id = UUID()
    var username: String
    var image: String
    var caption: String
    var likes: Int = 0
    var comments: [String] = []
    
    mutating func addLike() {
        likes += 1
    }
    
    mutating func addComment(comment: String) {
        comments.append(comment)
    }
}

struct PostsPageView: View {
    var posts: [Post]
    var body: some View {
        NavigationView {
            List(posts) { post in
                PostRowView(post: post)
            }
            .navigationBarTitle("Posts")
        }
    }
}

struct PostRowView: View {
    @State private var newComment: String = ""
    @State private var post: Post
    @State private var isLiked: Bool = false
    
    init(post: Post) {
        _post = State(initialValue: post)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(post.username)
                .font(.headline)
            Text(post.caption)
                .font(.subheadline)
            Image(post.image)
                .resizable()
                .scaledToFit()
                .frame(height: 100)
            HStack {
                Button(action: {
                    isLiked.toggle()
                    if isLiked{
                        post.addLike()
                    }else{
                        post.likes -= 1
                    }
                }) {
                    Image(systemName: isLiked ? "heart.fill": "heart")
                }
                Text("\(post.likes)")
                Spacer()
                Button(action: {
                }) {
                    Image(systemName: "text.bubble")
                }
            }
            HStack {
                TextField("Add a comment", text: $newComment)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    post.addComment(comment: newComment)
                    newComment = ""
                }) {
                    Text("Post Comment")
                }
                .disabled(newComment.isEmpty)
            }
            ForEach(post.comments, id: \.self) {comment in Text(comment)}
                .padding()
                .border(Color.gray, width: 1)
        }
    }
}

    
    struct PostsPageView_Previews: PreviewProvider {
        static var previews: some View {
            let mockPosts: [Post] = [
                Post(username: "user1", image: "image1", caption: "This is the first post."),
                Post(username: "user2", image: "image2", caption: "I've posted on an app!"),
                Post(username: "user3", image: "image3", caption: "Just chilling."),
            ]
            
            return PostsPageView(posts: mockPosts)
            
        }
    }
