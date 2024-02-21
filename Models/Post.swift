//
//  Post.swift
//  MobileAcebook
//
//  Created by Katie-Rose Anthonisz on 21/02/2024.
//

import Foundation

struct FormSection: Identifiable {
    let id = UUID()
    let key: String
    let header: String?
}


// codable so that we can receive things and send things to an api

final class Message: Codable {
    
    var id = UUID()
    var message: String
    var image: String?
    
    init(message: String, image: String) {
        self.message = message
        self.image = image
    }
}
