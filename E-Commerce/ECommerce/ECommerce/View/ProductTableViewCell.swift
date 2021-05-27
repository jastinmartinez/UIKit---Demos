//
//  ProductTableViewCell.swift
//  ECommerce
//
//  Created by Jastin on 26/5/21.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    func setValue(name: String,price: Double)  {
        self.nameLabel.text = name
        self.priceLabel.text = String(format: "%.2f", price)
    }
}
