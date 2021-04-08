//
//  DetailTableViewModelType.swift
//  testproj
//
//  Created by Macbook on 06.04.2021.
//

import Foundation

protocol DetailTableViewModelType {
    func readLocalFile(forName name: String) -> Data?
    func parsing(jsonData: Data)
    
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> DetailViewCellViewModel?
}
