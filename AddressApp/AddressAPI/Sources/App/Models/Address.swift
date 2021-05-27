//
//  File.swift
//  
//
//  Created by Jastin on 27/5/21.
//

import Vapor
import Fluent

final class Address: Content,Model
{
    static var schema: String = "address"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "address_street")
    var street: String
    
    @Field(key: "address_suite_apartment")
    var  suiteApartment: String
    
    @Field(key: "address_city")
    var city: String
    
    @Field(key: "address_state")
    var state: String
    
    @Parent(key: "customer_id")
    var customerID: Customer
    
    
    init() {
        
    }
    
    init(id: UUID?, street: String, city: String, state: String,customerID: UUID) {
        
        self.id = id
        self.street = street
        self.city = city
        self.state = state
        self.$customerID.id = customerID
        
    }
}
