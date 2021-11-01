//
//  RequiredFieldsAlertViewController.swift
//  Contacts
//
//  Created by Jastin on 31/10/21.
//

import Foundation
import UIKit

class RequiredFieldsAlerViewController  {
    
    private var alertController:UIAlertController
    
    init(message: String) {
        
        alertController = UIAlertController(title: "Required Missing Field", message: message, preferredStyle: .alert)
    }
    
    var alert:UIAlertController {
        
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
       
        return alertController
    }
}
