//
//  PostsView.swift
//  MobileAcebook
//
//  Created by Reece Owen on 20/02/2024.
//

import SwiftUI

struct Post: Identifiable {
    var id = UUID()
    var username: String
    var image: String
    var caption: String
    var likes: Int = 0
    var comments: [String] = []
    var isPosted: Bool = false
    
    mutating func addLike() {
        likes += 1
    }
    
    mutating func addComment(comment: String) {
        comments.append(comment)
        isPosted = true
    }
}

struct PostsPageView: View {
    @ObservedObject var postViewModel = PostViewModel()
    var posts: [Post]
    var body: some View {
        NavigationView {
            NavigationStack{
                ZStack(alignment: .top) {
                    Color("backgroudBlue")
                        .ignoresSafeArea()
                    
                    VStack {
                        Image("acebookLogo")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding()
                        
                        Text("Posts")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding()
                        
                        List(posts) { post in
                            PostRowView(post: post)
                        } .onAppear{
                            postViewModel.post()
                        }
                    }
                    .navigationBarHidden(true)
                }
            }
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
                    .foregroundColor(.white)
                Text(post.caption)
                    .font(.subheadline)
                    .foregroundColor(.white)
                Image(post.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200,height: 200)
                HStack {
                    Button(action: {
                        isLiked.toggle()
                        if isLiked {
                            post.addLike()
                        } else {
                            post.likes -= 1
                        }
                    }) {
                        Image(systemName: isLiked ? "heart.fill": "heart")
                            .foregroundColor(isLiked ? .red : .white)
                    }
                    Text("\(post.likes)")
                        .foregroundColor(.white)
                    Spacer()
                    Button(action: {
                    }) {
                        Image(systemName: "text.bubble")
                            .foregroundColor(.white)
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
                            .foregroundColor(.white)
                    }
                    .disabled(newComment.isEmpty)
                }
                ForEach(post.comments, id: \.self) {comment in Text(comment)}
                    .foregroundColor(post.isPosted ? .white : .black)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1))
            }
            .padding()
            .background(Color("darkBlueButton"))
            .cornerRadius(10)
            .padding()
        }
    }
    
    
    struct PostsPageView_Previews: PreviewProvider {
        static var previews: some View {
           let mockPosts: [Post] = [
                Post(username: "Kitty", image: "cat", caption: "Meow"),
                Post(username: "Brick", image: "house", caption: "Look at this house!"),
                Post(username: "Bob", image: "beach", caption: "Just chilling."),
           ]
            
            return PostsPageView(posts: mockPosts)
            
        }
    }

