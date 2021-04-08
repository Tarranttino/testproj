//
//  DetailViewCellViewModel.swift
//  testproj
//
//  Created by Macbook on 07.04.2021.
//

import Foundation

class DetailViewCellViewModel: DetailViewCellViewModelType  {
    
    private var content: DetailContent
    
    var messageText: String {
        content.message
    }
    
    var amountDouble: Double {
        content.amount
    }
    
    var date: Date {
        content.timestamp
    }
    
    var userId: Int {
        content.userId
    }
    
    init(content: DetailContent) {
        self.content = content
    }
}
