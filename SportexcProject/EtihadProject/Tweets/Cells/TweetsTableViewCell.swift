//
//  TweetsTableViewCell.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 12/04/2022.
//

import UIKit

class TweetsTableViewCell: UITableViewCell {
    @IBOutlet weak var tweetImg: UIImageView!
    @IBOutlet weak var tweetTitle: UILabel!
    @IBOutlet weak var tweetDesc: UILabel!
    @IBOutlet weak var tweetConclusion: UILabel!
    
    @IBOutlet weak var showMoreBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func showMoreBtnPressed(_ sender: Any) {
    }
}
