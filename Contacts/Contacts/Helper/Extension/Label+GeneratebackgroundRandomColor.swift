//
//  Label+GeneratebackgroundRandomColors.swift
//  Contacts
//
//  Created by Jastin on 31/10/21.
//

import Foundation
import UIKit

extension UILabel {
    
    func generateRandomBackgroundColor () {
        
        self.backgroundColor = UIColor(red: .random(in: 0...1), green:.random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
    }
}
