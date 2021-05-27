//
//  InputValidation.swift
//  ECommerce
//
//  Created by Jastin on 26/5/21.
//

import UIKit

extension UIAlertController {
    @objc func productName(_ name: String) -> Bool {
        return !name.isEmpty
    }
    @objc func productPrice(_ price: Double) -> Bool {
        return price > -1
    }
    
    @objc func textDidChange() {
            if let name = textFields?[0].text,
                let price = textFields?[1].text,
                let action = actions.last {
                action.isEnabled = productName(name) && productPrice(Double(price) ?? -1)
            }
        }
}
