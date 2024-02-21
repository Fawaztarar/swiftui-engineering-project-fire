//
//  DateUtils.swift
//  Acebook
//
//  Created by Fawaz Tarar on 16/02/2024.
//

import Foundation

let postDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium  // Example style, adjust as needed
    formatter.timeStyle = .short
    return formatter
}()
