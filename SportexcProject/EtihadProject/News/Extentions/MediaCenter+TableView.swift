//
//  MediaCenter+TableView.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 12/04/2022.
//

import UIKit

extension MediaCenterViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mediaCenterArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MediaCenterTableViewCell
        cell.cellImg.image = mediaCenterArray[indexPath.row].img
        cell.title.text = mediaCenterArray[indexPath.row].title
        cell.timeLabel.text = mediaCenterArray[indexPath.row].time
        cell.descriptionLabel.text = mediaCenterArray[indexPath.row].description
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: self )
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destination = segue.destination as? DescriptionViewController{
//
//        }
    }
}
