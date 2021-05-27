//
//  File.swift
//  
//
//  Created by Jastin on 27/5/21.
//

import Vapor
import Fluent

struct AddressController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let addressRoute = routes.grouped("address")
        addressRoute.post( use: addAddress)
    }
    func addAddress(req: Request) throws -> [Address] {
        var addressResult = [Address]()
        let address = try req.content.decode([Address].self)
        for item in address{
            let _  = item.save(on: req.db).map {item }
            addressResult.append(item)
        }
        return addressResult
    }
}
