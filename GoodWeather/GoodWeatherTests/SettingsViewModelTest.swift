//
//  SettingsViewModelTest.swift
//  GoodWeatherTests
//
//  Created by Jastin Martinez on 4/24/21.
//

import XCTest
@testable import GoodWeather

class SettingsViewModelTest: XCTestCase {
    private var settingsVM: SettingsViewModel!
    override func setUp() {
        super.setUp()
        settingsVM = SettingsViewModel()
    }
    
    func test_A_displayname_for_farenheit() {
        XCTAssertEqual(self.settingsVM.selectedUnit.unitName, "Fahrenheit")
    }
    
    func test_B_default_unit_is_fanrenheit() {
        XCTAssertEqual(settingsVM.selectedUnit, .fahrenheit)
    }
    
    func test_C_user_selection() {
        settingsVM.selectedUnit = .celsius
        XCTAssertEqual(settingsVM.selectedUnit, .celsius)
    }
    
    func test_D_displayname_for_celsius() {
        XCTAssertEqual(self.settingsVM.selectedUnit.unitName, "Celsius")
        DbHelper.UserDefault.removeKey()
    }
    
    override func tearDown() {
        super.tearDown()
    }
}
