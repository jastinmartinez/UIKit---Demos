//
//  CurrencyTextField.swift
//  HowMuchWillCost
//
//  Created by Jastin Martinez on 4/26/21.
//

import UIKit

class CurrencyTextField: UITextField {
    
    override func draw(_ rect: CGRect) {
        symbolLabel()
    }
    
    fileprivate func symbolLabel() {
        let size: CGFloat = 20
        let currencyLabel = UILabel(frame: CGRect(x: 5, y: (frame.size.height / 2) - size / 2, width: size, height: size))
        currencyLabel.backgroundColor = #colorLiteral(red: 0.6360013641, green: 0.6360013641, blue: 0.6360013641, alpha: 0.7978667202)
        currencyLabel.textAlignment = .center
        currencyLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        currencyLabel.layer.cornerRadius = 5.0
        currencyLabel.clipsToBounds = true
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = .current
        currencyLabel.text = formatter.currencySymbol
        addSubview(currencyLabel)
    }
    
    fileprivate func customizeTextField() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.25)
        textAlignment = .center
        layer.cornerRadius = 5.0
        
        if let unWrappedPlaceHolder = placeholder {
            let placeHolder = NSAttributedString(string: unWrappedPlaceHolder, attributes: [.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),])
            attributedPlaceholder = placeHolder
            textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeTextField()
    }
}
