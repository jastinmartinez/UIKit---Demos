//
//  ViewController.swift
//  OneTimeCode
//
//  Created by Jastin on 9/2/22.
//

import UIKit

class ViewController: UIViewController {

    var _oneTimeCodeTextField = UITextField()
    var _digitLabelList: [UILabel] = []
    var didFinishEnterDigits: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onCreate()
    }
    
    fileprivate func onCreate()
    {
        self.view.backgroundColor = .purple
        setOneTimeCodeTextField()
        setDigitsLabelStackView()
        didFinishEnterDigits = { code in
            
            print(code)
        }
    }
    
    fileprivate func setOneTimeCodeTextField() {
        
        _oneTimeCodeTextField.translatesAutoresizingMaskIntoConstraints = false
        _oneTimeCodeTextField.keyboardType = .numberPad
        _oneTimeCodeTextField.borderStyle = .none
        _oneTimeCodeTextField.textColor = .clear
        _oneTimeCodeTextField.tintColor = .clear
        _oneTimeCodeTextField.textContentType = .oneTimeCode
        _oneTimeCodeTextField.becomeFirstResponder()
        _oneTimeCodeTextField.addTarget(self, action: #selector(didTextChange), for: .editingChanged)
        _oneTimeCodeTextField.delegate = self
        
        self.view.addSubview(_oneTimeCodeTextField)

        NSLayoutConstraint.activate([
            _oneTimeCodeTextField.widthAnchor.constraint(equalToConstant: 300),
            _oneTimeCodeTextField.heightAnchor.constraint(equalToConstant: 100),
            _oneTimeCodeTextField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            _oneTimeCodeTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    fileprivate func setDigitsLabelStackView()  {
        
        let _stackView = UIStackView()
        
        _stackView.translatesAutoresizingMaskIntoConstraints = false
        _stackView.axis = .horizontal
        _stackView.alignment = .fill
        _stackView.distribution = .fillEqually
        _stackView.spacing = 10
        self.view.addSubview(_stackView)
        
        for _ in 1...4 {
            
            let _label = UILabel()
        
            _label.textColor = .black
            _label.text = "."
            _label.backgroundColor = .white
            _label.textAlignment = .center
            _label.font = .systemFont(ofSize: 40)
            _label.layer.cornerRadius = 20
            _label.clipsToBounds = true
            _label.backgroundColor = .white
            _label.isUserInteractionEnabled = true
            
            _stackView.addArrangedSubview(_label)
            
            _digitLabelList.append(_label)
        }
        
        NSLayoutConstraint.activate([
        
            _stackView.topAnchor.constraint(equalTo:self._oneTimeCodeTextField.topAnchor),
            _stackView.leftAnchor.constraint(equalTo:self._oneTimeCodeTextField.leftAnchor),
            _stackView.rightAnchor.constraint(equalTo: self._oneTimeCodeTextField.rightAnchor),
            _stackView.bottomAnchor.constraint(equalTo: self._oneTimeCodeTextField.bottomAnchor)
        ])
    }
    
    @objc fileprivate func didTextChange(sender: UITextField) {
        
        guard let text = sender.text, text.count <= _digitLabelList.count else { return }
        
        for index in 0..<_digitLabelList.count {
            
            let _currentLabel = _digitLabelList[index]
            
            if index < text.count {
                let _textIndex = text.index(text.startIndex, offsetBy: index)
                _currentLabel.text = String(text[_textIndex])
            }
            else {
                _currentLabel.text = "."
            }
        }
        
        if text.count == _digitLabelList.count {
            
            didFinishEnterDigits?(text)
        }
    }
}

extension ViewController : UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let characterCount = textField.text?.count else { return false }
        
        return characterCount < _digitLabelList.count || string == ""
    }
}

