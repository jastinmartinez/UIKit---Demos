//
//  BorderButton.swift
//  app-swoosh
//
//  Created by Jastin Martinez on 4/17/21.
//

import UIKit

class BorderButton: UIButton {

    
    override func awakeFromNib() {
        layer.borderWidth = 3.0
        layer.borderColor = UIColor.white.cgColor
    }

}
