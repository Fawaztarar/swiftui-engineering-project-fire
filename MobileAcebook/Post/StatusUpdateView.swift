//
//  StatusUpdateView.swift
//  MobileAcebook
//
//  Created by Fawaz Tarar on 21/02/2024.
//

import Foundation
import SwiftUI


struct StatusUpdateView: View {
    @State private var statusText: String = ""
    @State private var isNavigating: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: "person.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            TextField("What's on your mind?", text: $statusText)
                .padding(20)
                              .foregroundColor(.white)
                              .background(Color.clear) //
                              .padding(.leading, 10)
            
            Button(action: {
                // Implement the action to choose a photo
            }) {
                Image(systemName: "photo")
            }
            .foregroundColor(.white)
            .padding(.trailing, 10)
        }
        .background(
                        NavigationLink(destination: CreatePostView(), isActive: $isNavigating) {
                            EmptyView()
                        }
                        .hidden()  // Hide the NavigationLink to not interfere visually
                    )
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color.white.opacity(10))  // Adjusted for visibility
                    .cornerRadius(20)
                    .padding(.horizontal, 10)
                }
            }


struct StatusUpdateView_Previews: PreviewProvider {
    static var previews: some View {
        StatusUpdateView()
    }
}
