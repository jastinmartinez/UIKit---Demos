//
//  DbHelper.swift
//  AddressApp
//
//  Created by Jastin on 27/5/21.
//

import Foundation

enum ModelType {
    case Company
    case Address
}

final class DbHelper {
    
    let userDefault = UserDefaults.standard
    
    func setTemporalKey(id: Any,obj: ModelType)  {
        
        if obj == .Address {
            setValue(for: Constant.userDefaults.addressKey,with: id)
        }
        else if obj == .Company {
            setValue(for: Constant.userDefaults.companyKey,with: id)
        }
     
    }
    
    func getTemporalKey(_ objc: ModelType) -> Any? {
        
        if objc == .Address {
            
            return userDefault.value(forKey: Constant.userDefaults.addressKey)
          
        }
        else if objc == .Company {
            return userDefault.value(forKey: Constant.userDefaults.companyKey)
        }
        return nil
    }
    
    fileprivate func setValue(for value:String, with id: Any) {
        userDefault.removeObject(forKey: value)
        userDefault.setValue(id, forKey: value)
    }
}
