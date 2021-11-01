//
//  ContactViewController+Delegate+DataSource.swift
//  Contacts
//
//  Created by Jastin on 30/10/21.
//

import Foundation

import UIKit

extension ContactViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return contactPresenter.contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let contactTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.tableViewCellIdentifiers.contactTableViewCell, for: indexPath) as! ContactTableViewCell
        
        contactTableViewCell.setTableViewValues(contactPresenter.contacts[indexPath.row])
        
        return contactTableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        contactPresenter.contact = contactPresenter.contacts[indexPath.row]
        
        performSegue(withIdentifier: Constants.segues.contactDetailsViewController, sender: nil)
       
    }
}
