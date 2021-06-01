//
//  ProductViewController+TableView.swift
//  ProductApp
//
//  Created by Jastin on 31/5/21.
//

import Foundation
import UIKit

extension ProductViewController: UITableViewDelegate,UITableViewDataSource,ProductViewDelegate {
    
    func didStartSearching() {
        DispatchQueue.main.async {
            self.productTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchController.isActive {
            return productPresenter.filteredProducts.count
        }
        return productPresenter.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.TableViewCell.productTableViewCell, for: indexPath ) as! ProductTableViewCell
        
        if searchController.isActive {
            cell.bindProductToOutlets(vm: productPresenter.filteredProducts[indexPath.row])
        }
        else {
            cell.bindProductToOutlets(vm: productPresenter.products[indexPath.row])
        }
        return cell
    }
    
    func didProductsLoad() {
        DispatchQueue.main.async {
            self.productTableView.reloadData()
        }
    }
}
