//
//  ProductViewDelegate.swift
//  ProductApp
//
//  Created by Jastin on 31/5/21.
//

import Foundation

protocol ProductViewDelegate {
    
    /// Notify View when product array is loaded
    func didProductsLoad()
    
    /// Notify View when user start typing in searchbar
    func didStartSearching()
}
