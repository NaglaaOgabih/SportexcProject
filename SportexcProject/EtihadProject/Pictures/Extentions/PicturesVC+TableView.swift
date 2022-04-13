//
//  PicturesVC+TableView.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 12/04/2022.
//

import UIKit
import Kingfisher
extension PicturesViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return picturesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "picturesCell", for: indexPath) as! PicturesTableViewCell
        
        let url = URL(string: picturesData[indexPath.row].image)
        cell.pictureImg.kf.setImage(with: url)
        cell.pictureLabel.text = picturesData[indexPath.row].title
        return cell
    }
    
    
}
