//
//  Double+Extensions.swift
//  GoodWeather
//
//  Created by Jastin Martinez on 4/21/21.
//

import Foundation
extension Double {
    func formatAsDegree() -> String {
        return String(format: "%.2f°",self)
    }
}
