//
//  CompanyViewModel.swift
//  AddressApp
//
//  Created by Jastin on 26/5/21.
//

import Foundation

class CompanyViewModel {
    
    var getCompanies: [Company]  {
        return  [Company(id: 1, description: "Netflix", image: "company1"),
                 Company(id: 2, description: "Apple", image: "company2"),
                 Company(id: 3, description: "Facebook", image: "company3"),
                 Company(id: 4, description: "Mozilla", image: "company4"),]
    }
}
