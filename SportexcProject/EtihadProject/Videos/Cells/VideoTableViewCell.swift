//
//  VideoTableViewCell.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 12/04/2022.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var videoImg: UIImageView!
    @IBOutlet weak var videoTxt: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
