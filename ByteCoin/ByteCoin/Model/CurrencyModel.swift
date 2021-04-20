
import Foundation

struct CurrencyModel : Decodable{
    let rate: Double
    var rateToString: String {
        get
        {
            return String(format: "%.2f", rate)
        }
    }
}

