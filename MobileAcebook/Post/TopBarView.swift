//
//  TopBarView.swift
//  MobileAcebook
//
//  Created by Fawaz Tarar on 21/02/2024.
//

import Foundation
import SwiftUI

struct TopBarView: View {
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




struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarView()
    }
}
