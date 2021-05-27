//
//  Constant.swift
//  AddressApp
//
//  Created by Jastin on 26/5/21.
//

import Foundation

struct Constant {
    
    struct uRL {
        
        static let baseUrl = "http://127.0.0.1:8080"
        
        static let customerUrl = "\(baseUrl)/customer"
        
        static let addressUrl = "\(baseUrl)/address"
    }
    struct reusbleIdentifier {
        
        static let addCustomerTableViewCell = "AddCustomerTableViewCell"
        
        static let companyCollectionReusableView = "CompanyCollectionReusableView"
        
        static let customerTableViewCell = "CustomerTableViewCell"
        
        static let addAddressTableViewCell = "AddAddressTableViewCell"
        
        
    }
    struct segue {
        
        static let customerViewController = "CustomerViewController"
        
        static let addAddressViewController = "AddAddressViewController"

    }
    struct userDefaults {
        
        static let companyKey = "companyId"
        static let addressKey = "addressId"

    }
}
