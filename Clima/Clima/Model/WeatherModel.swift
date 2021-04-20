
import Foundation
struct WeatherModel {
    
    let conditionId: Int
    let cityName: String
    var tempeture: Double
    var tempetureToString: String {get {return String(format: "%.1f", tempeture)}}
    var pictureName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
    
}


