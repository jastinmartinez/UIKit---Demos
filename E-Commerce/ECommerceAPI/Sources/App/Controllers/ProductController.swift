//
//  File.swift
//  
//
//  Created by Jastin on 25/5/21.
//

import Vapor
import Fluent


struct ProductController: RouteCollection,IController {
    adasd
    typealias aType = Product
    
    func boot(routes: RoutesBuilder) throws {
        let productRoute = routes.grouped("product")
        productRoute.post(use:add)
        productRoute.put(use:update)
        productRoute.get(use:index)
        productRoute.delete(":product_id",use:remove)
        
    }
    
    
    func add(req: Request) throws -> EventLoopFuture<Product> {
        let product = try req.content.decode(Product.self)
        return product.save(on: req.db).map { product }
    }
    
    
    func index(req: Request) throws -> EventLoopFuture<[Product]> {
        return Product.query(on: req.db).all()
    }
    
    
    func remove(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return Product.find(req.parameters.get("product_id"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap {$0.delete(on: req.db)
                .transform(to: .ok)
            }
    }
    
    
    func update(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let product = try req.content.decode(Product.self)
        return Product.find(product.id, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap{
                $0.description = product.description
                $0.price = product.price
                return $0.update(on: req.db)
                    .transform(to: .ok)
            }
    }
    
}


