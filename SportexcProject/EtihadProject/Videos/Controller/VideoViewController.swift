//
//  VideoViewController.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 12/04/2022.
//

import UIKit

class VideoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func newsBtnPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MediaCenterViewController") as! NewsViewController
         navigationController?.pushViewController(vc,
         animated: true)

    }
    
    @IBAction func picturesBtnPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PicturesViewController") as! PicturesViewController
         navigationController?.pushViewController(vc,
         animated: true)
    }
    @IBAction func videoBtnPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VideoViewController") as! VideoViewController
         navigationController?.pushViewController(vc,
         animated: true)
    }
    @IBAction func tweetsBtnPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TweetsViewController") as! TweetsViewController
         navigationController?.pushViewController(vc,
         animated: true)
    }

}
