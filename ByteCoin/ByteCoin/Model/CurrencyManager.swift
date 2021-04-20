

import Foundation

struct CurrencyManager {
    var currencyManagerDelegate: CurrencyManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    //YOUR_API_KEY_HERE
    let apiKey = "41509C62-D035-47BF-9B77-5FFE3E7CB830"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    
    func performRequest(currency: String)  {
        let urlString = "\(self.baseURL)/\(currency)?apikey=\(apiKey)"
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let dataTask = session.dataTask(with: url) { (data, response, error) in
                if let _dataTaskError = error {
                    currencyManagerDelegate?.didFailCurrencyWithErrors(erros: _dataTaskError)
                    return
                }
                if let _data = data {
                    if let currencyData = jsonParse(raw: _data){
                        print(currencyData.rate)
                    currencyManagerDelegate?.didCurrencyChange(for: currencyData)
                    }
                }
            }
            dataTask.resume()
        }
    }
    
    func jsonParse(raw currencyData: Data) -> CurrencyModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData =  try decoder.decode(CurrencyModel.self, from: currencyData)
            let currencyChangeValue = CurrencyModel(rate: decodedData.rate)
            return currencyChangeValue
        } catch  {
            currencyManagerDelegate?.didFailCurrencyWithErrors(erros: error)
            return nil
        }
    }
}


protocol CurrencyManagerDelegate {
    func  didCurrencyChange(for currency: CurrencyModel)
    func didFailCurrencyWithErrors(erros: Error)
}
