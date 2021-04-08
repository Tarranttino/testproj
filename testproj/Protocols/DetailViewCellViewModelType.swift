//
//  DetailViewCellViewModelType.swift
//  testproj
//
//  Created by Macbook on 07.04.2021.
//

import Foundation

protocol DetailViewCellViewModelType: class {
    
    var messageText: String { get }
    var amountDouble: Double { get }
    var date: Date { get }
    var userId: Int { get }
}
