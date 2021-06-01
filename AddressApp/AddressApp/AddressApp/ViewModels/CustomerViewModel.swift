//
//  CustomerViewModel.swift
//  AddressApp
//
//  Created by Jastin on 26/5/21.
//

import Foundation


class CustomerViewModel {
    
    var customer: Customer
    
    init(customer: Customer) {
        
        self.customer = customer
    }
}

class CustomerViewModels {
    
    var delegate: NotifyCustomerView?
    
    private(set) var customersViewModels = [CustomerViewModel]()
    {
        didSet {
            delegate?.didCustomerChange()
        }
    }
    
    private(set) var customerTemporaryViewModel = [CustomerViewModel]() {
        didSet {
            
            delegate?.didCustomerChange()
        }
    }
    
    func getCustomersBySelectedCompany(at index: Int) {
        
        let get = IGetResource<Customer>(url: URLRequest(url: URL(string: "\(Constant.uRL.customerUrl)/\(index)")!)) { data in
            let decodeCustomer  = try? JSONDecoder().decode([Customer].self, from: data)
            return decodeCustomer!
        }
        
        customersViewModels.removeAll()
        
        APIService().getRequest(resource: get) {
            customers in
            if !customers.isEmpty {
                for customer in customers {
                    if let resultCustomer = customer {
                        self.customersViewModels.append(CustomerViewModel(customer: resultCustomer))
                    }
                }
            }
            
        }
    }
    
    func addTemporalCustomer(_ customerViewModel: CustomerViewModel) {
        
        customerTemporaryViewModel.append(customerViewModel)
        
    }
    
    func removeTemporalCustomer(at index: Int)  {
        customerTemporaryViewModel.remove(at: index)
    }
    
    func saveOnDatabase() {
        
        customersViewModels = customerTemporaryViewModel
        self.delegate?.didCustomerChange()
        let post = IPostResource(url: URLRequest(url: URL(string: Constant.uRL.customerUrl)!), model: customerTemporaryViewModel.map{$0.customer}){data in
            if let decodeCustomer = try? JSONDecoder().decode([Customer].self, from: data)
            {
                return decodeCustomer
            }
            return [nil]
        }
        
        customerTemporaryViewModel.removeAll()
        
        APIService().postRquest(resource: post) { customers in
            if !customers.isEmpty {
                for customer in customers {
                    if let customer = customer {
                        let _ = self.customersViewModels.map {$0.customer = customer}
                    }
                }
            }
        }
    }
    
}



