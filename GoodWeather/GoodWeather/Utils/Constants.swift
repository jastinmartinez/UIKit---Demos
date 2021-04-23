//
//  Constants.swift
//  GoodWeather
//
//  Created by Jastin Martinez on 4/21/21.
//

import Foundation
struct Constants {
    struct Urls {
        static func urlForWeatherCity(city: String) -> URL {
            let unit = DbHelper.UserDefault.getUnit() ?? Unit.fahrenheit.rawValue
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=0b1ac19d892fa596cfda6e8d27a664b9&units=\(unit)")!
        }
    }
    struct decodeModel<T> where T : Decodable {
        static func fromJson(data: Data) -> T? {
            return try? JSONDecoder().decode(T.self, from: data)
        }
    }
    struct segues {
        static let AddWeatherViewController:String  = "AddWeatherViewController"
        static let SettingsViewController:String  = "SettingsViewController"
    }
    struct UserDefaultName {
        static let Unit: String = "unit"
    }
}
