//
//  WeatherViewModelsTests.swift
//  GoodWeatherTests
//
//  Created by Jastin Martinez on 4/24/21.
//

import XCTest
@testable import GoodWeather

class WeatherViewModelsTests: XCTestCase {

    private var weatherVMS: WeatherViewModels!
    override func setUp() {
        super.setUp()
        weatherVMS = WeatherViewModels()
        weatherVMS.addWeatherViewModel(WeatherViewModel(weather: WeatherReponse(name: "Houston", main: Weather(temp: 32, humidity: 0))))
        
        weatherVMS.addWeatherViewModel(WeatherViewModel(weather: WeatherReponse(name: "Austin", main: Weather(temp: 72, humidity: 0))))
    }
    
    func test_convert_fahrenheit_to_celsius() {
        let celsiusTempetature = [0.0,22.2222]
        self.weatherVMS.updateUnit(to: .celsius)
        for (index,vm) in weatherVMS.weatherViewModels.enumerated() {
            XCTAssertEqual(vm.temperature.rounded(), celsiusTempetature[index].rounded())
        }
    }

}
