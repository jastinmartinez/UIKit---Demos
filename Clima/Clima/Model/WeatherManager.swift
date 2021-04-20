
protocol WeatherManagerDelegate {
    func didUpateWeather(weather: WeatherModel)
    func didFailWithErrors(error: Error)
}

import Foundation
struct WeatherManager {
    var delagate: WeatherManagerDelegate?
    
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?&appid=e4f92f865b8546db41bc2a9c09726631&units=metric"
    
    func fetchWeather(cityName: String){
        let UrlString = "\(weatherUrl)&q=\(cityName)"
        performRequest(with: UrlString)
    }
    func fetchWeather(lat: Double, lon: Double){
        let UrlString = "\(weatherUrl)&lat=\(lat)&lon=\(lon)"
        performRequest(with: UrlString)
    }
    func performRequest(with UrlString: String) {
        if  let url = URL(string: UrlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if let errors = error {
                    delagate?.didFailWithErrors(error: errors)
                    return
                }
                if let safeData = data {
                   if let weather = ParseJSON(weaterData: safeData)
                   {
                     delagate?.didUpateWeather(weather: weather)
                   }
                }
            }
            task.resume()
        }
    }
    
    func ParseJSON(weaterData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData =  try  decoder.decode(WeatherData.self, from: weaterData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let weather = WeatherModel(conditionId: id, cityName: name, tempeture: temp)
            return weather
        }catch {
            delagate?.didFailWithErrors(error: error)
            return nil
        }
    }
}
