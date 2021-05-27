//
//  File.swift
//  
//
//  Created by Jastin on 25/5/21.
//


import Vapor

protocol IController {
    associatedtype aType
    func add(req: Request) throws -> EventLoopFuture<aType>
    func index(req: Request) throws -> EventLoopFuture<[aType]>
    func remove(req: Request) throws -> EventLoopFuture<HTTPStatus>
    func update(req: Request) throws -> EventLoopFuture<HTTPStatus>
}
