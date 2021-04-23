//
//  String+Extension.swift
//  GoodWeather
//
//  Created by Jastin Martinez on 4/21/21.
//

import Foundation
extension String{
    
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
