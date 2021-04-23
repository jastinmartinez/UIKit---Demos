//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by Jastin Martinez on 4/21/21.
//

import UIKit


protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherViewController: UIViewController {
    
    @IBOutlet weak var cityNameTextField: UITextField!
   
    private var addWeatherViewModel = AddWeatherViewModel()
    var delegate: AddWeatherDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func saveCityButtonPressed() {
        if let city = cityNameTextField.text {
            addWeatherViewModel.addWeather(for: city) { weatherViewModel in
                self.delegate?.addWeatherDidSave(vm: weatherViewModel)
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }
}
