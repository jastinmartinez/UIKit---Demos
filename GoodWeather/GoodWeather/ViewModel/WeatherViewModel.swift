//
//  WeatherViewModel.swift
//  GoodWeather
//
//  Created by Jastin Martinez on 4/21/21.
//

import Foundation
class WeatherViewModels {
    private var weatherViewModels = [WeatherViewModel]()
    
    func addWeatherViewModel(_ vm: WeatherViewModel)  {
        weatherViewModels.append(vm)
    }
    func numerOfRows(_ section: Int) -> Int {
        return weatherViewModels.count
    }
    func modelAt(for index: Int) -> WeatherViewModel {
        return weatherViewModels[index]
    }
    func updateUnit(to unit: Unit){
        switch unit {
        case .celsius:
            toCelcius()
        case .fahrenheit:
            toFahrenheit()
        }
    }
    private func toCelcius() {
        weatherViewModels =  weatherViewModels.map {vm in let weathermodel = vm
            weathermodel.temperature = (weathermodel.temperature - 32) * 5/9
            return weathermodel
        }
    }
    private func toFahrenheit() {
        weatherViewModels =  weatherViewModels.map {vm in let weathermodel = vm
            weathermodel.temperature = (weathermodel.temperature * 9/5 ) + 32
            return weathermodel
        }
    }
}

class WeatherViewModel {
    let weather: WeatherReponse
    
    init(weather: WeatherReponse) {
        self.weather = weather
        self.temperature = weather.main.temp
    }
    
    var city: String { return self.weather.name}
    var temperature: Double
}

