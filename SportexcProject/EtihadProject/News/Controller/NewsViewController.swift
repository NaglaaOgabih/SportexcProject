//
//  MediaCenterViewController.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 12/04/2022.
//

import UIKit
import Alamofire

class NewsViewController: UIViewController {
    var newsDataArray : [NewsData] = []
    @IBOutlet weak var newsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabsApi()
        newsTableView.reloadData()
    }
    func tabsApi(){
        let decoder = JSONDecoder()
        let lang = Locale.current.languageCode!

        let params:[String:Any] = ["lang": lang , "tabId":"1"]
        let headers: HTTPHeaders = [:]
        Request.req(url:"https://etihad.emcan-group.com/api/mediaCenter/tab?lang=\(lang)&tabId=1", headers: headers, params: params, meth: .get) { [self](data, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            if let data = data {
                do {
                    let tabsDecoded = try decoder.decode(NewsModel.self, from: data)
                    newsDataArray = tabsDecoded.payload ?? []
                    newsTableView.reloadData()
                } catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}
