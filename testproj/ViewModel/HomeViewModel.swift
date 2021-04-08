//
//  ViewModel.swift
//  testproj
//
//  Created by Macbook on 06.04.2021.
//

import Foundation

class HomeViewModel: HomeTableViewModelType {
    
    var categories = [CategoryContent]()
    
    
    func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }

    func parsing(jsonData: Data)  {
        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(RootCategory.self, from: jsonData)
            
            decodedData.categories.forEach {
                let newEl = CategoryContent(category: $0.category, userIds: $0.userIds)
                categories.append(newEl)
            }
            
            print(categories)
        } catch {
            print(error)
        }
    }
    
    
    
    func numberOfRows() -> Int {
        return categories.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> HomeViewCellViewModel? {
        let category = categories[indexPath.row]
        return HomeViewCellViewModel(category: category)
    }
    
    func titleOfCell(forIndexPath indexPath: IndexPath) -> String {
        let title = categories[indexPath.row].category
        
        return title
    }
}
