//
//  IModelViewModel.swift
//  ECommerce
//
//  Created by Jastin on 26/5/21.
//

import Foundation

protocol IModelViewModel {
    
    associatedtype Atype
    
    func add(_ model: Atype,notify: @escaping () -> ())
    
    func get(notify: @escaping () -> ())
    
    func remove(_ model: Atype,notify: @escaping () -> ())
}
