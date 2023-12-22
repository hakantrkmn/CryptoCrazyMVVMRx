//
//  CryptoTableViewCell.swift
//  CryptoCrazyMVVMRx
//
//  Created by Hakan Türkmen on 19.12.2023.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    public var item : Crypto!{
        didSet{
            self.nameLabel.text = item.name
            self.priceCell.text = item.priceUsd?.DoubleToDecimal()
        }
    }
    
    
    

}
