//
//  SettingsTableViewController.swift
//  GoodWeather
//
//  Created by Jastin Martinez on 4/22/21.
//

import UIKit

protocol SettingsDelegate {
    func settingsDone(vm: SettingsViewModel)
}

class SettingsTableViewController: UITableViewController {
    
    private var settingViewModel = SettingsViewModel()
    var delegate: SettingsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //MARK: - done button
    @IBAction func done() {
        if let unWrapDelegate = self.delegate {
            unWrapDelegate.settingsDone(vm: settingViewModel)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.visibleCells.forEach{cell in cell.accessoryType = .none}
        if let cell = tableView.cellForRow(at: indexPath)
        {
            cell.accessoryType = .checkmark
            let uni = Unit.allCases[indexPath.row]
            settingViewModel.selectedUnit = uni
        }
    }
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return settingViewModel.unit.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingsItem = settingViewModel.unit[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell",for: indexPath)
        cell.textLabel?.text = settingsItem.unitName
        if settingsItem == settingViewModel.selectedUnit {
            cell.accessoryType = .checkmark
        }
        return cell
    }
}


