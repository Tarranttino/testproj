//
//  TableViewController.swift
//  testproj
//
//  Created by Macbook on 06.04.2021.
//

import UIKit

class HomeTableViewController: UITableViewController {

    var homeViewModel: HomeTableViewModelType?
    
    var titleLabel: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "BentonSans Medium", size: 16)!]
        tableView.tableFooterView = UIView()
        
        homeViewModel = HomeViewModel()
        
        let json = homeViewModel?.readLocalFile(forName: "home")
        if let json = json {
            homeViewModel?.parsing(jsonData: json)
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return homeViewModel?.numberOfRows() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HomeTableViewCell
        
        guard let tableViewCell = cell, let viewModel = homeViewModel else {
            return UITableViewCell()
        }
        
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        
        tableViewCell.viewModel = cellViewModel
        
        return tableViewCell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        titleLabel = homeViewModel?.titleOfCell(forIndexPath: indexPath)
        
        performSegue(withIdentifier: "goToDetail", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        if identifier == "goToDetail" {
            if let dvc = segue.destination as? DetailTableViewController {
                dvc.titleLabel = titleLabel
            }
        }
    }
    
    

    
}
