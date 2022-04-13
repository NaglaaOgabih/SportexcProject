//
//  MediaCenter+TableView.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 12/04/2022.
//

import UIKit
import Kingfisher
extension NewsViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! MediaCenterTableViewCell
        let url = URL(string: newsDataArray[indexPath.row].image ?? "" )
        cell.cellImg.kf.setImage(with: url)
        cell.title.text = newsDataArray[indexPath.row].title
        cell.timeLabel.text = newsDataArray[indexPath.row].date
        cell.descriptionLabel.text = newsDataArray[indexPath.row].desc
//        DispatchQueue.main.async {
//            tableView.reloadData()
//        }
  
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let selectedIndex = indexPath.row
        performSegue(withIdentifier: "showDetail", sender: self )
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DescriptionViewController{
            destination.newsId = newsDataArray[newsTableView.indexPathForSelectedRow?.row ?? 0 ].id
        }
    }
}
