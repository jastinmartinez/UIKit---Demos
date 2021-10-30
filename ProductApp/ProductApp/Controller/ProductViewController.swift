//
//  ViewController.swift
//  ProductApp
//
//  Created by Jastin on 31/5/21.
//

import UIKit

class ProductViewController: UIViewController {
    
    @IBOutlet weak var productTableView: UITableView!
    
    let searchController = UISearchController()
    
     var productPresenter: ProductPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productPresenter = ProductPresenter(productService: ProductServie())
        productPresenter.delegate = self
        productTableView.dataSource = self
        productTableView.delegate = self
        productPresenter.getProducts()
        initSearchController()
    }
}

