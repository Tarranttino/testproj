//
//  DeteilTableViewController.swift
//  testproj
//
//  Created by Macbook on 06.04.2021.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    var detailViewModel: DetailTableViewModelType?
    
    var titleLabel: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = titleLabel
        
        navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "BentonSans Medium", size: 16)!]
        
        tableView.tableFooterView = UIView()
        
        detailViewModel = DetailViewModel()
        if let titleLabel = titleLabel {
            let json = detailViewModel?.readLocalFile(forName: titleLabel)
            if let json = json {
                detailViewModel?.parsing(jsonData: json)
            }
        }
        
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return detailViewModel?.numberOfRows() ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as? DetailTableViewCell
        
        guard let tableViewCell = cell, let detailViewModel = detailViewModel  else {
            return UITableViewCell()
        }
        
        let cellViewModel = detailViewModel.cellViewModel(forIndexPath: indexPath)
        
        tableViewCell.viewModel = cellViewModel
        
        return tableViewCell
    }
}
