//
//  Constant.swift
//  Contacts
//
//  Created by Jastin on 30/10/21.
//

import Foundation

struct Constants
{
    
    struct urls {
        
        static func avatarUrl(name: String) -> String { return "https://avatars.dicebear.com/api/micah/\(name).svg" }
    }
    struct segues {
        
        static let contactCreateViewController = "contactCreateViewController"
        
        static let contactDetailsViewController = "contactDetailsViewController"
        
        static let contactEditViewController = "contactEditViewController"

    }
    
    struct tableViewCellIdentifiers {
        
        static let contactTableViewCell = "contactTableViewCell"
    }
}
