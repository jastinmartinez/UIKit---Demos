//
//  ProductViewController.swift
//  ECommerce
//
//  Created by Jastin on 26/5/21.
//

import UIKit

class ProductViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let productViewModel = ProductViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.productViewModel.get {self.tableView.reloadData()}
    }
    
    // MARK: add Function
    
    @IBAction func addProductPressed(_ sender: Any) {
        
        var productName = UITextField()
        var productPrice = UITextField()
        
        let alertController = UIAlertController(title: "Producto", message: "", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Guardar", style: .default) { (action) in
            self.productViewModel.add(Product(id: nil, description: productName.text!, price: productPrice.text!.toDouble) ){self.tableView.reloadData()}
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (_) in
            
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        
        alertController.addTextField {text in
            productName = text
            productName.placeholder = "Name"
            
            
        }
        alertController.addTextField {text in
            productPrice = text
            productPrice.placeholder = "Price"
            productPrice.keyboardType = .numberPad
            
        }
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}

// MARK: ProductViewController Table View

extension ProductViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productViewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.ReusableCellIdentifier.productTableViewCell) as! ProductTableViewCell
        cell.setValue(name: productViewModel.products[indexPath.row].description, price: productViewModel.products[indexPath.row].price)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            productViewModel.remove(productViewModel.products[indexPath.row]) {tableView.reloadData()}
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

