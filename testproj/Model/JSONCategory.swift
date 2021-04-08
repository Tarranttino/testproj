//
//  JSONCategory.swift
//  testproj
//
//  Created by Macbook on 08.04.2021.
//

import Foundation

struct RootCategory: Codable {
    let categories: [categories]
}

struct categories: Codable {
    let category: String
    let userIds: [Int]
}
