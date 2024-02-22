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

struct PostData: Codable {
    let message: String
    var publicID = UUID()
}
