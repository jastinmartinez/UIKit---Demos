//
//  PostData.swift
//  H4X0R News
//
//  Created by Jastin Martinez on 3/9/21.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post : Decodable,Identifiable {
    var id: String {
        get {
        return objectID
        }
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}

