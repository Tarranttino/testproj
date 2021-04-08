//
//  HomeViewCellViewModel.swift
//  testproj
//
//  Created by Macbook on 06.04.2021.
//

import Foundation

class HomeViewCellViewModel: HomeViewCellViewModelType {
    
    private var category: CategoryContent
    
    var nameOfCategory: String {
        return category.category
    }
    
    var arrayOfIds: [Int] {
        return category.userIds
    }
    
    init(category: CategoryContent) {
        self.category = category
    }
}
