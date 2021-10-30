//
//  ImageView+MakeRounded.swift
//  Contacts
//
//  Created by Jastin on 30/10/21.
//

import Foundation
import UIKit

extension UIImageView {
    
    func rounded () {
        
        self.layer.cornerRadius = (self.frame.width / 2) 
        self.layer.masksToBounds = true
        
    }
}
