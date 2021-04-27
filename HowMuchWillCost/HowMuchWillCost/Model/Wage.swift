//
//  Wage.swift
//  HowMuchWillCost
//
//  Created by Jastin Martinez on 4/26/21.
//

import Foundation

class Wage {
    class func getHours(forWage wage: Double, andPrice price: Double) -> Int {
        return Int(ceil(price / wage))
    }
}
