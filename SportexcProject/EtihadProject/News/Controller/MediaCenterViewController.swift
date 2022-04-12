//
//  MediaCenterViewController.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 12/04/2022.
//

import UIKit

class MediaCenterViewController: UIViewController {
    var mediaCenterArray : [MediaCenterModel] = []

    @IBOutlet weak var newsBtn: UIButton!{
        didSet{
            newsBtn.setTitle(NSLocalizedString("News", comment: ""), for: .normal)
        }
    }
    @IBOutlet weak var picturesBtn: UIButton!{
        didSet{
            
            picturesBtn.setTitle(NSLocalizedString("Pictures", comment: ""), for: .normal)
        }
    }
    @IBOutlet weak var videosBtn: UIButton!{
        didSet{
            
            videosBtn.setTitle(NSLocalizedString("Videos", comment: ""), for: .normal)
        }
    }
    @IBOutlet weak var TweetsBtn: UIButton!{
        didSet{
            TweetsBtn.setTitle(NSLocalizedString("Tweets", comment: ""), for: .normal)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navSettings()
        let mediaCenter1 = MediaCenterModel(img: UIImage(named: "sportImg")!, title:  NSLocalizedString("Basketball meeting", comment: ""), time: NSLocalizedString("12 hours ago", comment: "") , description: NSLocalizedString("disc", comment: ""))
        let mediaCenter2 = MediaCenterModel(img: UIImage(named: "sportImg")!, title:  NSLocalizedString("Basketball meeting", comment: ""), time: NSLocalizedString("12 hours ago", comment: "") , description: NSLocalizedString("disc", comment: ""))
        let mediaCenter3 = MediaCenterModel(img: UIImage(named: "sportImg")!, title:  NSLocalizedString("Basketball meeting", comment: ""), time: NSLocalizedString("12 hours ago", comment: "") , description: NSLocalizedString("disc", comment: ""))
        let mediaCenter4 = MediaCenterModel(img: UIImage(named: "sportImg")!, title:  NSLocalizedString("Basketball meeting", comment: ""), time: NSLocalizedString("12 hours ago", comment: "") , description: NSLocalizedString("disc", comment: ""))
        mediaCenterArray.append(mediaCenter1)
        mediaCenterArray.append(mediaCenter2)
        mediaCenterArray.append(mediaCenter3)
        mediaCenterArray.append(mediaCenter4)

    }
    func navSettings(){
        navigationItem.title = NSLocalizedString("MediaCenter", comment: "")
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes

        let backButton = UIBarButtonItem()
        backButton.image = UIImage(systemName: "chevron.backward")
        navigationItem.leftBarButtonItem = backButton
        
        let langBtn = UIBarButtonItem(image:  UIImage(systemName: "globe"), style: .plain, target: self, action: #selector(langChange))
//        let langBtn = UIBarButtonItem()
//        langBtn.image = UIImage(systemName: "character.book.closed.ar")
        navigationItem.rightBarButtonItem = langBtn
    }
    @objc func langChange(){
        let currentLang = Locale.current.languageCode
        let newLang = currentLang == "en" ? "ar" : "en"
        UserDefaults.standard.setValue([newLang], forKey: "AppleLanguages")
        exit(0)
        
    }
}
