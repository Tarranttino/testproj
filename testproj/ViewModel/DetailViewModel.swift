//
//  DetailViewModel.swift
//  testproj
//
//  Created by Macbook on 06.04.2021.
//

import Foundation

class DetailViewModel: DetailTableViewModelType {
    
    var contents = [DetailContent]()
    
    func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
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
            decoder.dateDecodingStrategy = .iso8601
            let decodedData = try decoder.decode(RootDetail.self, from: jsonData)
            
            decodedData.activities.forEach {
                let newEl = DetailContent(message: $0.message, amount: $0.amount, userId: $0.userId, timestamp: $0.timestamp)
                contents.append(newEl)
            }
//            print(contents)
        } catch {
            print(error)
        }
    }
    
    func numberOfRows() -> Int {
        return contents.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> DetailViewCellViewModel? {
        let content = contents[indexPath.row]
        return DetailViewCellViewModel(content: content)
    }
}
