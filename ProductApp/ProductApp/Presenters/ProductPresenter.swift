//
//  ProductPresenter.swift
//  ProductApp
//
//  Created by Jastin on 31/5/21.
//

import Foundation

class ProductPresenter {
    
    private var productService: ProductServie!
    
    private(set) var filteredProducts = [Product]()
    
    private(set) var products = [Product]()
    {
        didSet {
            self.delegate?.didProductsLoad()
        }
    }
    
    var delegate: ProductViewDelegate?
    
    init(productService: ProductServie) {
        self.productService = productService
    }
    
    func getProducts()  {
        productService.getProducts { products in
            if products != nil {
                self.products = products!
            }
        }
    }
    
    /// Filter products in list and notify view when is complete
    /// - Parameter text: information to filter
    func filterProducs(_ text: String){
        filteredProducts = products
        if !text.isEmpty {
            filteredProducts = products.filter({$0.Maker.lowercased().contains(text.lowercased())})
        }
        delegate?.didStartSearching()
    }
}
