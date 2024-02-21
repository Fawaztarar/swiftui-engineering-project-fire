//
//  FacebookPostView3.swift
//  MobileAcebook
//
//  Created by Fawaz Tarar on 21/02/2024.
//

import Foundation
import SwiftUI

struct FacebookPostView: View {
    @State private var isLiked = false
    @State private var likeCount = 200
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                //Image(post.profilePicture)
                Image(systemName: "person.circle")
                    .resizable()
                    .foregroundColor(.white)
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 1))
                
                VStack(alignment: .leading) {
//                    Text(post.username)
                    Text("Tarar Fawaz")
                        .foregroundColor(.white)
                        .font(.headline)
//                    Text(post.createdAt, style: .date)
                    Text("3 Jan")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Image(systemName: "ellipsis")
                    .foregroundColor(.white)
            }
            .padding()
            
//            Text(post.content)
            Text("\"شيري اور فوجي کا موٹرسائیکل پر بیمشق\"")
                .font(.body)
                .foregroundColor(.white)
                .padding([.leading, .trailing])
        
            
            Image("post")
                .resizable()
                .scaledToFit()
            
            HStack {
                Button(action: {
                                    // Toggle the like status and update the like count accordingly
                                    isLiked.toggle()
                                    if isLiked {
                                        likeCount += 1
                                    } else {
                                        likeCount -= 1
                                    }
                                }) {
                                    Image(systemName: isLiked ? "hand.thumbsup.fill" : "hand.thumbsup")
                                        .foregroundColor(isLiked ? .blue : .white)  // Change color to blue when liked
                                }

                                Text("\(likeCount) Likes")
                                    .foregroundColor(.white)
                
                Button(action: {
                    // Comment action
                }) {
                    Image(systemName: "bubble.left.fill")
                }
                .foregroundColor(.white)
                
                Text("500 Comments")
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: {
                    // Share action
                }) {
                    Image(systemName: "arrowshape.turn.up.right.fill")
                }
                .foregroundColor(.white)
                
                Text("200 Shares")
                    .foregroundColor(.white)
            }
            .padding()
        }
        .background(Color.black)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}



struct FacebookPostView_Previews: PreviewProvider {
    static var previews: some View {
        
        FacebookPostView()
    }
}
