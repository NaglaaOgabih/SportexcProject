//
//  SubscriptionVC+TableView.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 04/04/2022.
//

import UIKit

extension SubscriptionViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if determineCell == "current"{
            return currentSubscriptions?.count ?? 0
        }else{
            return lastSubscriptions.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SubscriptionTableViewCell
        if determineCell == "current"{
            cell.sportType.text = currentSubscriptions?[indexPath.row].sportName
            cell.childName.text = currentSubscriptions?[indexPath.row].child?.childName
            cell.birthdayLabel.text = currentSubscriptions?[indexPath.row].child?.childBirthdate
            cell.childAge.text = currentSubscriptions?[indexPath.row].child?.childAge
            cell.classesNum.text = currentSubscriptions?[indexPath.row].classNumber
            cell.RemainingClassesNum.text = currentSubscriptions?[indexPath.row].classRemain
            cell.SubscriptionDate.text = currentSubscriptions?[indexPath.row].date
        }else{
            cell.sportType.text = lastSubscriptions[indexPath.row].sportName
            cell.childName.text = lastSubscriptions[indexPath.row].child?.childName
            cell.birthdayLabel.text = lastSubscriptions[indexPath.row].child?.childBirthdate
            cell.childAge.text = lastSubscriptions[indexPath.row].child?.childAge
            cell.classesNum.text = lastSubscriptions[indexPath.row].classNumber
            cell.RemainingClassesNum.text = lastSubscriptions[indexPath.row].classRemain
            cell.SubscriptionDate.text = lastSubscriptions[indexPath.row].date

//            DispatchQueue.main.async {
//                self.dataTableView.reloadData()
//            }
        }
        return cell
    }    
}
