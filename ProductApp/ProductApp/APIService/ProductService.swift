//
//  ProductService.swift
//  ProductApp
//
//  Created by Jastin on 31/5/21.
//

import Foundation

class ProductServie {
    
    func getProducts(completion: @escaping ([Product]?) -> ()) {
        APIService().request(url: RequestBuilder().prepare(url: Constant.uRL.product)) { data, response, error in
            if let data = data  {
                if let user = ObjectToJSON<Product>.decode(data){
                    completion(user)
                }
            }
        }
    }
}
