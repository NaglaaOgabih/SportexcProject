//
//  ShowPicViewController.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 12/04/2022.
//

import UIKit
import Kingfisher

class ShowPicViewController: UIViewController {
    var showImageLink : String?
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: showImageLink ?? "")
        image.kf.setImage(with: url)

}
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
}
