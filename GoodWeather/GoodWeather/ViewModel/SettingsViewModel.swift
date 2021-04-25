//
//  SettingsViewModel.swift
//  GoodWeather
//
//  Created by Jastin Martinez on 4/22/21.
//

import Foundation
enum Unit: String,CaseIterable {
    case celsius = "metric"
    case fahrenheit = "imperial"
}

extension Unit {
    var unitName: String {
        get {
            switch self {
            case .celsius:
                return "Celsius"
            case .fahrenheit:
                return "Fahrenheit"
            }
        }
    }
}


class SettingsViewModel {
    let unit = Unit.allCases
    var selectedUnit : Unit {
        get {
            return Unit(rawValue: DbHelper.UserDefault.getUnit()!)!
        }
        set {
            DbHelper.UserDefault.setUnit(for: newValue.rawValue)
        }
    }
}
