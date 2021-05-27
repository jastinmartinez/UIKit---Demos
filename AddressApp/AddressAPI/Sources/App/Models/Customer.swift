//
//  File.swift
//  
//
//  Created by Jastin on 26/5/21.
//

import Vapor
import Fluent

final class Customer: Content,Model {
    static var schema: String = "customer"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "customer_name")
    var name: String
    
    @Field(key: "customer_email")
    var email: String
    
    @Field(key: "customer_phone_number")
    var phoneNumber: String
    
    @Field(key: "customer_company_id")
    var companyID: Int
    
    init() {}
    
    init(id: UUID? = nil, name: String, email: String,companyID: Int) {
        self.id = id
        self.name = name
        self.email = email
        self.companyID = companyID
    }
}
