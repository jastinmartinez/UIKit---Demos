//
//  ViewController.swift
//  Contacts
//
//  Created by Jastin on 30/10/21.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var contactTableView: UITableView!
    
    private(set) var contactPresenter = ContactsPresenter()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        contactPresenter.contactNotifyTableViewDelegate = self
    }
    
    @IBAction func contactCreateButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: Constants.segues.contactCreateViewController, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Constants.segues.contactCreateViewController {
            
            guard let contactCreateViewController = segue.destination as? ContactCreateViewController else { return }
            
            contactCreateViewController.contactPresenter = contactPresenter
            
            contactCreateViewController.contactPresenter?.contactNotifyTableViewDelegate = self
        }
    }
}

