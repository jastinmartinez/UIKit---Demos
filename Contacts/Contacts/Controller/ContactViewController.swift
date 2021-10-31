//
//  ViewController.swift
//  Contacts
//
//  Created by Jastin on 30/10/21.
//

import UIKit

class ContactViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func contactCreateButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: Constants.segues.contactCreateViewController, sender: nil)
        
    }
}

