//
//  PicDetailVC+CollectionView.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 12/04/2022.
//

import UIKit
import SwiftUI

extension PicDetailViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return album.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pictCell", for: indexPath) as! PicDetailCollectionViewCell
        let url = URL(string: album[indexPath.row].image)
        cell.picImg.kf.setImage(with: url)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: collectionView.bounds.size.width/3.0 - 10, height: 120)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "imageShow", sender: indexPath )
//        performSegue(withIdentifier: "imageShow", sender: self )
    }
     func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "imageShow"
        {
            let indexPath : NSIndexPath = sender as! NSIndexPath
            let vc = segue.destination as! ShowPicViewController
            vc.showImageLink = self.album[indexPath.row].image
//            print(vc.showImageLink)
        }
    }
}
