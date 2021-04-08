//
//  HomeTableViewCell.swift
//  testproj
//
//  Created by Macbook on 06.04.2021.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    
    weak var viewModel: HomeViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else {return}
            categoryLabel.text = viewModel.nameOfCategory
            
        }
    }

}
