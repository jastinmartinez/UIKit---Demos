//
//  BorderButton.swift
//  dev-profile
//
//  Created by Jastin Martinez on 4/19/21.
//

import UIKit

class BorderImageView: UIImageView {
    
    override func awakeFromNib() {
        layer.borderWidth = 3.0
        layer.borderWidth = 1.0
        layer.masksToBounds = false
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
}
