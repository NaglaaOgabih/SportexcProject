//
//  PicDetailVC+CollectionView.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 12/04/2022.
//

import UIKit

extension PicDetailViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "", for: indexPath) as! PicDetailCollectionViewCell
        return cell
    }
    
    
}
