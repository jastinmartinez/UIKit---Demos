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
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let contactTableViewCell = tableView.dequeueReusableCell(withIdentifier: "contactTableViewCell", for: indexPath) as! ContactTableViewCell
        
       // contactTableViewCell.setTableViewValues(Contact(name: "Jastin Martinez", logo: UIImage(named: "Picture1")!))
        
        return contactTableViewCell
    }
    
}
