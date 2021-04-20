
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currencyPickerView: UIPickerView!
    var currencyManager = CurrencyManager()
    
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPickerView.delegate = self
        currencyPickerView.dataSource = self
        currencyManager.currencyManagerDelegate = self
        
    }
}



extension ViewController : UIPickerViewDataSource,UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyManager.currencyArray.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        currencyManager.performRequest(currency:currencyManager.currencyArray[row])
        currencyLabel.text = currencyManager.currencyArray[row]
        return currencyManager.currencyArray[row]
    }
}
extension ViewController : CurrencyManagerDelegate {
    func didCurrencyChange(for currency: CurrencyModel) {
        DispatchQueue.main.async {
            self.rateLabel.text  = currency.rateToString
        }
    }
    
    func didFailCurrencyWithErrors(erros: Error) {
        print(erros)
    }
}



