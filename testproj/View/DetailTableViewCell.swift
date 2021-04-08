//
//  DetailTableViewCell.swift
//  testproj
//
//  Created by Macbook on 07.04.2021.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    
    weak var viewModel: DetailViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else {return}
            
            
            func htmlToAttributedString(string : String) -> NSAttributedString{
                    var attribStr = NSMutableAttributedString()
                    
                    do {//, allowLossyConversion: true
                        attribStr = try NSMutableAttributedString(data: string.data(using: String.Encoding.unicode)!, options: [ .documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
                        
                        let textRangeForFont : NSRange = NSMakeRange(0, attribStr.length)
                        attribStr.addAttributes([NSAttributedString.Key.font : UIFont(name: "BentonSans Regular", size:16)!], range: textRangeForFont)
                        
                    } catch {
                        print(error)
                    }
                    
                    return attribStr
                }
            messageLabel.attributedText = htmlToAttributedString(string: viewModel.messageText)
            
            let amountStr = String(format: "%.2f", viewModel.amountDouble)
            
            amountLabel.text = String("$\(amountStr)")
                
            let image = UIImage(named: String(viewModel.userId))
            avatarImage.image = image
            
            let formatter = ISO8601DateFormatter()
            formatter.formatOptions = [.withFullDate]
            dateLabel.text = formatter.string(from: viewModel.date)
            
        }
    }
    
}
