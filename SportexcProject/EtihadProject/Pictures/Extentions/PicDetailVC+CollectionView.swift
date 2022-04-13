//
//  PicDetailVC+CollectionView.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 12/04/2022.
//

import UIKit

extension PicDetailViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return album.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pictCell", for: indexPath) as! PicDetailCollectionViewCell
        let url = URL(string: album[indexPath.row].image)
        cell.picImg.kf.setImage(with: url)
        return cell
    }
    
    private func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.performSegue(withIdentifier: "imageDetail", sender: indexPath)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PicDetailViewController{
            let cell = sender as! PicDetailCollectionViewCell
            let indexPaths = self.imagesCollectionView.indexPath(for: cell)
                destination.id = album[indexPaths!.row].id


        }
    }
    
}
