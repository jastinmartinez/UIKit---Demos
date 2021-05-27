//
//  File.swift
//  
//
//  Created by Jastin on 26/5/21.
//

import Fluent
import Vapor

struct CustomerController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let customerRoute = routes.grouped("customer")
        customerRoute.post(use:addCustomer)
        customerRoute.get(use:getCustomers)
        customerRoute.get(":company_id",use:getCustomersByCompany)
    }
    
    func addCustomer(req: Request) throws -> [Customer]
    {
        var customersResult = [Customer]()
        let customers = try req.content.decode([Customer].self)
        for item in customers{
            let _  = item.save(on: req.db).map {item }
            customersResult.append(item)
        }
        return customersResult
    }
    
    func getCustomers(req: Request) throws -> EventLoopFuture<[Customer]> {
        return Customer.query(on: req.db).all()
    }
    
    func getCustomersByCompany(req: Request) throws -> EventLoopFuture<[Customer]> {
        if let companyIdParam = req.parameters.get("company_id") {
            let convertStringToInt = Int(companyIdParam)!
            return Customer.query(on: req.db).filter(\.$companyID == convertStringToInt).all()
        }
        throw Abort(.badRequest)
    }
}
