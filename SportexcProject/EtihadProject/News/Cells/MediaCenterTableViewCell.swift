//
//  MediaCenterTableViewCell.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 12/04/2022.
//

import UIKit

class MediaCenterTableViewCell: UITableViewCell {
    @IBOutlet weak var cellImg: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

        
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
