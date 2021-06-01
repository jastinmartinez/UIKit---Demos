//
//  ProductService.swift
//  ProductAppTests
//
//  Created by Jastin on 1/6/21.
//

import Foundation
import XCTest
@testable import ProductApp

class ProductServiceTest: XCTestCase {
    
    var productService: ProductServie!
    var productPresenter: ProductPresenter!
    
    override func setUp() {
        productService = ProductServie()
        productPresenter = ProductPresenter(productService: productService)
    }
    
    func test_ArrayOfProductReturnNotNil()  {
        productService.getProducts { producs in
            XCTAssertNotNil(producs)
        }
    }
    
    func test_BindBetweenProductServiceAndProductPresenter()  {
        productPresenter = ProductPresenter(productService: productService)
        productService.getProducts { producs in
            XCTAssertEqual(producs?.count, self.productPresenter.products.count)
        }
    }
}
