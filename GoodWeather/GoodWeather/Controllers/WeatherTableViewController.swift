//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by Jastin Martinez on 4/21/21.
//

import UIKit

class WeatherTableViewController: UITableViewController,AddWeatherDelegate {
    //MARK: - variables
    private var weatherViewModels = WeatherViewModels()
    private var lastUnitSelection: Unit!
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        super.viewDidLoad()
        if let value = DbHelper.UserDefault.getUnit(){
            self.lastUnitSelection = Unit(rawValue: value)
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherViewModels.numerOfRows(section)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell",for: indexPath) as! WeatherTableViewCell
        let weatherViewmodel = weatherViewModels.modelAt(for: indexPath.row)
        cell.configure(weatherViewmodel)
        return cell
    }
    //MARK: - AddWeather Delegate
    func addWeatherDidSave(vm: WeatherViewModel) {
        weatherViewModels.addWeatherViewModel(vm)
        tableView.reloadData()
    }
    //MARK: - prepare for segue when call a view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.segues.AddWeatherViewController {
            prepareSegueForAddWeatherCityViewController(segue: segue)
        }
        else if segue.identifier == Constants.segues.SettingsViewController {
            prepareSegueForSettingsViewController(segue: segue)
        }
    }
    //MARK: - Assing delagate as self
    func prepareSegueForAddWeatherCityViewController(segue: UIStoryboardSegue)  {
        guard let navUINavigationController = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        guard let navAddWeatherViewController = navUINavigationController.viewControllers.first as? AddWeatherViewController else {
            fatalError("AddWeatherViewController not found")
        }
        navAddWeatherViewController.delegate = self
    }
    
    func prepareSegueForSettingsViewController(segue: UIStoryboardSegue)  {
        guard let navUINavigationController = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        guard let navSettingsViewController = navUINavigationController.viewControllers.first as? SettingsTableViewController else {
            fatalError("SettingsTableViewController not found")
        }
        navSettingsViewController.delegate = self
    }
}
//MARK: - Settings Delegate
extension WeatherTableViewController : SettingsDelegate {
    func settingsDone(vm: SettingsViewModel) {
        if let vmSelected = vm.selectedUnit?.rawValue {
            if lastUnitSelection.rawValue != vmSelected {
                weatherViewModels.updateUnit(to: lastUnitSelection)
                tableView.reloadData()
                lastUnitSelection = Unit(rawValue: vmSelected)
            }
        }
    }
}
