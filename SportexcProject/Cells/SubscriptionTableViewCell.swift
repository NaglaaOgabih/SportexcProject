//
//  SubscriptionTableViewCell.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 04/04/2022.
//

import UIKit

class SubscriptionTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImg: UIImageView!{
        didSet{
            profileImg.layer.cornerRadius = profileImg.frame.size.width/2
            profileImg.clipsToBounds = true
            profileImg.layer.borderWidth = 1
            profileImg.layer.borderColor = UIColor(named: "CustomYellow")?.cgColor
        }
    }
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var sportType: UILabel!
    @IBOutlet weak var viewColor: UIView!{
        didSet{
            viewColor.layer.cornerRadius = viewColor.frame.size.width/2
            viewColor.clipsToBounds = true
        }
    }
    @IBOutlet weak var cardBackground: UIView!{
        didSet{
        cardBackground.layer.cornerRadius = 12
        cardBackground.clipsToBounds = true
        cardBackground.layer.borderWidth = 2
        cardBackground.layer.borderColor = UIColor(named: "CustomYellow")?.cgColor
        }
    }
    @IBOutlet weak var childName: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var classesNum: UILabel!
    @IBOutlet weak var RemainingClassesNum: UILabel!
    @IBOutlet weak var SubscriptionDate: UILabel!
    @IBOutlet weak var childAge: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
