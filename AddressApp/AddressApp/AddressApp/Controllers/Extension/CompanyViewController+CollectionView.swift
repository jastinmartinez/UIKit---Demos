//
//  CompanyViewControllerCollectionView.swift
//  AddressApp
//
//  Created by Jastin on 26/5/21.
//

import UIKit

extension CompanyViewController: UICollectionViewDelegate,UICollectionViewDataSource  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return companyViewModel.getCompanies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.reusbleIdentifier.companyCollectionReusableView, for: indexPath) as! CompanyCollectionReusableView
        cell.setValueToOutlest(companyViewModel.getCompanies[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        DbHelper().setTemporalKey(id: indexPath.row, obj: .Company)
        performSegue(withIdentifier: Constant.segue.customerViewController, sender: nil)
    }
}
