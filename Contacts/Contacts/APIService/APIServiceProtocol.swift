//
//  APIServiceProtocol.swift
//  Contacts
//
//  Created by Jastin on 30/10/21.
//

import Foundation

protocol APIServiceProtocol {
    
    func getAvatar(name: String, completion: @escaping (Data) -> ())
}
