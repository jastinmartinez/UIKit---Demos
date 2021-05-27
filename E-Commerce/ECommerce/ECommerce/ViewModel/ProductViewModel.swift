//
//  ProductViewModel.swift
//  ECommerce
//
//  Created by Jastin on 26/5/21.
//

import Foundation
import Alamofire

class ProductViewModel: IModelViewModel {
    
    func add(_ product: Product,notify: @escaping () -> ())  {
        IWebService().postRequest(resource:  IPostResource<Product>(url: Constant.URL.productUrl, model: product) { data in
            let productDecoded = try? JSONDecoder().decode(Product.self, from: data)
            return productDecoded
        }) {data in
            if let data = data {
                self.products.append(data)
                notify()
            }
        }
    }
    
    func get(notify: @escaping () -> ())  {
        IWebService().getRequest(resource:  IGetResource<[Product]>(url: Constant.URL.productUrl) { data in
            let productDecoded = try? JSONDecoder().decode([Product].self, from: data)
            return productDecoded
        }) { data in
            if let data = data {
                self.products = data
                notify()
            }
        }
    }
    
    func remove(_ product: Product,notify: @escaping () -> ())  {
        if let index = self.products.firstIndex(where: {$0.id == product.id})
        {
            self.products.remove(at: index)
        }
        IWebService().delRequest(resource: URL(string: "\(Constant.URL.productUrl)/\(product.id!)")!) { data in
            if data != nil {
                notify()
            }
        }
    }
    
    typealias Atype = Product
    
    
    private(set) var products = [Product]()
    
    
}
