//
//  ProductTest.swift
//  ProductAppTests
//
//  Created by Jastin on 31/5/21.
//

@testable import ProductApp

import XCTest


class ProductTest: XCTestCase {
    
    
    func testInitProductNotNil()  {
        let product = Product(Id: "jenlooper-cactus",Description: "This project is a good learning project to get comfortable with soldering and programming an Arduino.", Maker: "@jenlooper",img: "https://user-images.githubusercontent.com/41929050/61567048-13938600-aa33-11e9-9cfd-712191013192.jpeg")
        XCTAssertNotNil(product)
    }

}
