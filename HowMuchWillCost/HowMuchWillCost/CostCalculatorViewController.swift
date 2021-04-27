//
//  ViewController.swift
//  HowMuchWillCost
//
//  Created by Jastin Martinez on 4/26/21.
//

import UIKit

class CostCalculatorViewController: UIViewController {
    
    @IBOutlet weak var itemPriceTextField: CurrencyTextField!
    @IBOutlet weak var wageTextField: CurrencyTextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateUIButton()
        hideOrShowLabels(for: true)
    }
    
    fileprivate func hideOrShowLabels(for enable: Bool) {
        resultLabel.isHidden = enable
        hoursLabel.isHidden  = enable
    }
    
    @IBAction func clearCalculatorButtonPressed(_ sender: Any) {
        hideOrShowLabels(for: true)
        wageTextField.text = ""
        itemPriceTextField.text = ""
    }
}
//MARK: - Button Creation
extension CostCalculatorViewController {
    
    fileprivate func calculateUIButton() {
        let calculatorButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        calculatorButton.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        calculatorButton.setTitle("Calculator", for: .normal)
        calculatorButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        calculatorButton.addTarget(self, action: #selector(calculateCost), for: .touchUpInside)
        wageTextField.inputAccessoryView = calculatorButton
        itemPriceTextField.inputAccessoryView = calculatorButton
    }
    
    @objc func calculateCost() {
        if let wageTxt = wageTextField.text, let priceTxt = itemPriceTextField.text {
            if let wage = Double(wageTxt),let price = Double(priceTxt) {
                view.endEditing(true)
                hideOrShowLabels(for: false)
                resultLabel.text = "\(Wage.getHours(forWage: wage, andPrice: price))"
            }
        }
    }
}

