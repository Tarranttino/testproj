//
//  JSON.swift
//  testproj
//
//  Created by Macbook on 06.04.2021.
//

import Foundation

struct RootDetail: Codable {
    let activities: [Activities]
}

struct Activities: Codable {
    let message: String
    let amount: Double
    let userId: Int
    let timestamp: Date
}

