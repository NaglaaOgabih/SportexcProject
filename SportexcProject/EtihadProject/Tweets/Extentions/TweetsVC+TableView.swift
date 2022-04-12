//
//  TweetsVC+TableView.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 12/04/2022.
//

import UIKit

extension TweetsViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath) as! TweetsTableViewCell
        return cell
    }
    
    
}
