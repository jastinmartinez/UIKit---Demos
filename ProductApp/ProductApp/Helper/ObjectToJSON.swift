//
//  ObjectToDecodableHelper.swift
//  ProductApp
//
//  Created by Jastin on 31/5/21.
//

import Foundation

struct ObjectToJSON<T> where T: Decodable {
    
    static func decode(_ data: Data) -> [T]? {
        return try? JSONDecoder().decode([T].self, from: data)
    }
}

