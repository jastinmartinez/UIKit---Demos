//
//  AddWeatherCityViewModel.swift
//  GoodWeather
//
//  Created by Jastin Martinez on 4/21/21.
//

import Foundation

class AddWeatherViewModel {
    
    func addWeather(for city: String,completion: @escaping (WeatherViewModel) -> Void)  {
        let weatherUrl = Constants.Urls.urlForWeatherCity(city: city)
         let weatherRosources = Resource<WeatherReponse>(url: weatherUrl) { data -> WeatherReponse? in
            let weatherResponseDecoded = Constants.decodeModel<WeatherReponse>.fromJson(data: data)
            
            return weatherResponseDecoded
        }
        WebServcie().load(resource: weatherRosources) { result in
            if let weatherRosources = result {
                let vm = WeatherViewModel(weather: weatherRosources)
                completion(vm)
            }
        }
    }
}
