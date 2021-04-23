//
//  DbHelper.swift
//  GoodWeather
//
//  Created by Jastin Martinez on 4/22/21.
//

import Foundation
struct DbHelper {
    struct UserDefault {
        static private let userDefault = UserDefaults.standard
        static func getUnit() -> String?
        {
            return userDefault.value(forKey: Constants.UserDefaultName.Unit) as? String
        }
        static func setUnit(for value: String)         {
            userDefault.setValue(value, forKey: Constants.UserDefaultName.Unit)
        }
    }
}
