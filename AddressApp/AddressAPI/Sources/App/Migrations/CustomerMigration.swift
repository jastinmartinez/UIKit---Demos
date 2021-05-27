//
//  File.swift
//  
//
//  Created by Jastin on 26/5/21.
//

import Fluent

extension Customer {
    struct Migration: Fluent.Migration {
        func prepare(on database: Database) -> EventLoopFuture<Void> {
            database.schema("customer")
                .id()
                .field("customer_name",.string,.required)
                .field("customer_email",.string,.required)
                .field("customer_phone_number",.string,.required)
                .field("customer_company_id",.int,.required)
                .create()
        }
        func revert(on database: Database) -> EventLoopFuture<Void> {
            database.schema("customer").delete()
        }
    }
}
