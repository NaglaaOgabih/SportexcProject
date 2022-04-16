//
//  MediaCenterViewController.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 13/04/2022.
//

import UIKit
import Alamofire
class MediaCenterViewController: UIViewController {


    @IBOutlet weak var newsView: UIView!
    @IBOutlet weak var tweetsView: UIView!
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var picturesView: UIView!
    @IBOutlet weak var pagesSegmentControl: UISegmentedControl!
    
    var tabsTitle : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabsApi()
        navSettings()
        setupSegmentControl()
        videoView.isHidden = false
        tweetsView.isHidden = true
        videoView.isHidden = true
        picturesView.isHidden = true
    }
    @IBAction func switchView(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            newsView.isHidden = false
            tweetsView.isHidden = true
            videoView.isHidden = true
            picturesView.isHidden = true
        case 1:
            newsView.isHidden = true
            tweetsView.isHidden = true
            videoView.isHidden = true
            picturesView.isHidden = false
            
        case 2:
            newsView.isHidden = true
            tweetsView.isHidden = true
            videoView.isHidden = false
            picturesView.isHidden = true
            
        case 3:
            newsView.isHidden = true
            tweetsView.isHidden = false
            videoView.isHidden = true
            picturesView.isHidden = true
        default:
            break
        }
    }
    func setupSegmentControl(){
       
        let font = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 28)]
        pagesSegmentControl.setTitleTextAttributes(font, for: .normal)
        
        let selectedTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        pagesSegmentControl.setTitleTextAttributes(titleTextAttributes, for: .normal)
        pagesSegmentControl.setTitleTextAttributes(selectedTitleTextAttributes, for: .selected)

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
    func tabsApi(){
        let decoder = JSONDecoder()
        var lang = Locale.current.languageCode!
        let params:[String:Any] = ["lang": lang]
        let headers: HTTPHeaders = [:]
        print(lang)

        Request.req(url:"https://etihad.emcan-group.com/api/mediaCenter?lang=\(lang)", headers: headers, params: params, meth: .get) { [self](data, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            if let data = data {
                do {
                    let tabsDecoded = try decoder.decode(TabsModel.self, from: data)
                    var counter = 0
                    for i in tabsDecoded.payload ?? []{
                        pagesSegmentControl.setTitle(NSLocalizedString(i.title ?? "", comment: ""), forSegmentAt: counter)
                        counter += 1
                        print(lang)
                    }
                } catch{
                    print(lang)
                    print(error.localizedDescription)
                }
            }
        }
    }
}
