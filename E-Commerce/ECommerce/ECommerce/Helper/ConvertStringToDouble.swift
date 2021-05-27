//
//  ConvertStringToDouble.swift
//  ECommerce
//
//  Created by Jastin on 26/5/21.
//

import Foundation
extension String
{
    var toDouble: Double {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return Double(truncating: formatter.number(from: self) ?? 0) 
    }
}
