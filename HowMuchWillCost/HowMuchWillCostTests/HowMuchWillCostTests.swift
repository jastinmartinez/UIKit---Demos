//
//  HowMuchWillCostTests.swift
//  HowMuchWillCostTests
//
//  Created by Jastin Martinez on 4/26/21.
//

import XCTest
@testable import HowMuchWillCost

class HowMuchWillCostTests: XCTestCase {
    
    func test_getHours()
    {
       XCTAssertEqual(Wage.getHours(forWage: 25, andPrice: 100), 4)
    }
    
    func test_getHoursWithDecimal()
    {
        XCTAssertEqual(Wage.getHours(forWage: 15.50, andPrice: 250.53), 17)
    }
}
