//
//  ProductViewController+SearchController.swift
//  ProductApp
//
//  Created by Jastin on 1/6/21.
//

import Foundation
import UIKit

extension ProductViewController: UISearchBarDelegate,UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        
         productPresenter.filterProducs(searchController.searchBar.text!)
    }
    
    func initSearchController()  {
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = .done
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
}
