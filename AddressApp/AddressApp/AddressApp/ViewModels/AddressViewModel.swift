//
//  AddressViewModel.swift
//  AddressApp
//
//  Created by Jastin on 27/5/21.
//

import Foundation
class AddressViewModel {
    var address: Address
    
    init(address: Address) {
        self.address = address
    }
}
class AddressViewModels {
    
    var delegate: NotifyAddressView?
    
    private(set) var temporalAddressViewModel = [AddressViewModel]() {
        didSet {

            delegate?.didAddressChange()
        }
    }
    
    func addTemporalAddresss(_ vm: AddressViewModel)  {
        
        temporalAddressViewModel.append(vm)
    }
    func removeTemporalCustomer(at index: Int)  {
        
        temporalAddressViewModel.remove(at: index)
    }
    
    func saveOnDatabase()  {
        
        let post = IPostResource(url: URLRequest(url: URL(string: Constant.uRL.addressUrl)!), model: temporalAddressViewModel.map{$0.address}) { data in
            if let decodeAddress = try? JSONDecoder().decode([Address].self, from: data)
            {
                return decodeAddress
            }
            return [nil]
        }
        
        temporalAddressViewModel.removeAll()
        
        APIService().postRquest(resource: post) { address in
            if !address.isEmpty {
                for address in address {
                    if let address = address {
                        let _ = self.temporalAddressViewModel.map{$0.address = address}
                    }
                }
            }
        }
    }
}
