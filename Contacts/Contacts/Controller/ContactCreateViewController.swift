//
//  AddContactViewController.swift
//  Contacts
//
//  Created by Jastin on 30/10/21.
//

import UIKit

class ContactCreateViewController: UIViewController {

    
    @IBOutlet weak var contactPictureImage: UIImageView!
    @IBOutlet weak var contactFirstNameTextField: UITextField!
    @IBOutlet weak var contactSecondNameTextField: UITextField!
    @IBOutlet weak var contactPhoneTextField: UITextField!
    @IBOutlet weak var contactPhoneTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var contactEmailTextField: UITextField!
    @IBOutlet weak var contactEmailTypeSegmentedControl: UISegmentedControl!
    
    private var contatcPresenter = ContactsPresenter()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    @IBAction func contactCreateSavedButtonPressed(_ sender: Any) {
        
        //contatcPresenter.addContact()
    }
    
    @IBAction func contactDeleteButtonPressed(_ sender: Any) {
        
    }
}
