//
//  HomeViewCellViewModelType.swift
//  testproj
//
//  Created by Macbook on 06.04.2021.
//

import Foundation

protocol HomeViewCellViewModelType: class {
    var nameOfCategory: String { get }
    var arrayOfIds: [Int] { get }
}
