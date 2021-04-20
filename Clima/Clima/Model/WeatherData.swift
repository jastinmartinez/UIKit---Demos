
import Foundation

struct WeatherData : Decodable {
    let name: String
    let main: Main
    let weather: [weather]
}

struct Main : Decodable{
    let temp: Double
}

struct weather: Decodable {
    let id: Int
    
}

