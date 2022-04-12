//
//  PicturesTableViewCell.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 12/04/2022.
//

import UIKit

class PicturesTableViewCell: UITableViewCell {
    @IBOutlet weak var pictureImg: UIImageView!
    @IBOutlet weak var pictureLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
