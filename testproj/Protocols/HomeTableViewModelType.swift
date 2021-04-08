//
//  HomeTableViewModelType.swift
//  testproj
//
//  Created by Macbook on 06.04.2021.
//

import Foundation

protocol HomeTableViewModelType {
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> HomeViewCellViewModel?
    func titleOfCell(forIndexPath indexPath: IndexPath) -> String
    
    func readLocalFile(forName name: String) -> Data?
    func parsing(jsonData: Data)
}
