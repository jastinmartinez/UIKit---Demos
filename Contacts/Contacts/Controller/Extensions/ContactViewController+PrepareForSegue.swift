//
//  ContactViewController+PrepareForSegue.swift
//  Contacts
//
//  Created by Jastin on 1/11/21.
//

import Foundation
import UIKit

extension ContactViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Constants.segues.contactCreateViewController {
            
            guard let contactCreateViewController = segue.destination as? ContactCreateOrEditViewController else { return }
        
            contactCreateViewController.contactPresenter.instance = contactPresenter
            
        }
        else if segue.identifier == Constants.segues.contactDetailsViewController {
            
            guard let contactDetailsViewController = segue.destination as? ContactDetailsViewController else { return }
            
            contactDetailsViewController.contactPresenter = contactPresenter
        }
    }
}
