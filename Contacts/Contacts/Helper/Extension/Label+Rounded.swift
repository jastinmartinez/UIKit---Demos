//
//  Label+Rounded.swift
//  Contacts
//
//  Created by Jastin on 30/10/21.
//

import Foundation
import UIKit

extension UILabel {
    
    func rounded () {
        
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        
    }
}
