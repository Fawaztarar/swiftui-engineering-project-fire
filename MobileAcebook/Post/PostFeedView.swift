
//
//  PostFeedView2.swift
//  MobileAcebook
//
//  Created by Fawaz Tarar on 21/02/2024.
//



import Foundation
import SwiftUI

struct PostFeedView: View {
    var body: some View {
        VStack(spacing: 0) {
            TopBarView()
            
            ScrollView {
                VStack(spacing: 10) {
                    
                    StatusUpdateView()
                    
                    ForEach(0..<5) { _ in
                        FacebookPostView()
                    }
                }
                .padding()
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .foregroundColor(.white)
    }
}





struct PostFeedView_Previews: PreviewProvider {
    static var previews: some View {
        PostFeedView()
    }
}
