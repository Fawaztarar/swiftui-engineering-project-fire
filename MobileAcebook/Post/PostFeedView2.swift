//
//  PostFeedView2.swift
//  MobileAcebook
//
//  Created by Fawaz Tarar on 21/02/2024.
//



import Foundation
import SwiftUI

struct PostFeedView2: View {
    var body: some View {
        VStack(spacing: 0) {
            TopBarView3()
            
            ScrollView {
                VStack(spacing: 10) {
                    StatusUpdateView3()
                    
                    ForEach(0..<5) { _ in
                        FacebookPostView3()
                    }
                }
                .padding()
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .foregroundColor(.white)
    }
}

struct TopBarView3: View {
    var body: some View {
        HStack {
            Spacer()
            
            Button(action: {
                // Implement the settings action
            }) {
                Image(systemName: "gear")
            }
            .foregroundColor(.white)
            .padding(.horizontal, 10)
            
            Button(action: {
                // Implement the search action
            }) {
                Image(systemName: "magnifyingglass")
            }
            .foregroundColor(.white)
            .padding(.horizontal, 10)
        }
        .padding(.vertical, 10)
        .background(Color.black)
    }
}

struct StatusUpdateView3: View {
    @State private var statusText: String = ""
    
    var body: some View {
        HStack {
            Image(systemName: "person.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            TextField("What's on your mind?", text: $statusText)
                .padding(.leading, 10)
                .foregroundColor(.white)
            
            Button(action: {
                // Implement the action to choose a photo
            }) {
                Image(systemName: "photo")
            }
            .foregroundColor(.white)
            .padding(.trailing, 10)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(20)
        .padding(.horizontal, 10)
    }
}

struct FacebookPostView3: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 1))
                
                VStack(alignment: .leading) {
                    Text("Tarar Fawaz")
                        .font(.headline)
                    Text("3 Jan")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Image(systemName: "ellipsis")
            }
            .padding()
            
            Text("\"شيري اور فوجي کا موٹرسائیکل پر بیمشق\"")
                .font(.body)
                .padding([.leading, .trailing])
            
            Image("post")
                .resizable()
                .scaledToFit()
            
            HStack {
                Button(action: {
                    // Like action
                }) {
                    Image(systemName: "hand.thumbsup.fill")
                }
                .foregroundColor(.white)
                
                Text("1.5k Likes")
                
                Button(action: {
                    // Comment action
                }) {
                    Image(systemName: "bubble.left.fill")
                }
                .foregroundColor(.white)
                
                Text("500 Comments")
                
                Spacer()
                
                Button(action: {
                    // Share action
                }) {
                    Image(systemName: "arrowshape.turn.up.right.fill")
                }
                .foregroundColor(.white)
                
                Text("200 Shares")
            }
            .padding()
        }
        .background(Color.black)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct PostFeedView2_Previews: PreviewProvider {
    static var previews: some View {
        PostFeedView2()
    }
}
