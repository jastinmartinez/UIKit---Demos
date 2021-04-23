//
//  Weather.swift
//  GoodWeather
//
//  Created by Jastin Martinez on 4/21/21.
//

import Foundation

struct WeatherReponse: Decodable {
    let name: String
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double
    let humidity: Double
}
