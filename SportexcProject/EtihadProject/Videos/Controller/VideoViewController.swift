//
//  VideoViewController.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 12/04/2022.
//

import UIKit
import Alamofire
class VideoViewController: UIViewController {
    @IBOutlet weak var videosTableView: UITableView!
    var videosArray : [Video]?
    override func viewDidLoad() {
        super.viewDidLoad()
        videosApi()
        // Do any additional setup after loading the view.
    }
    func videosApi(){
        let decoder = JSONDecoder()
        let params:[String:Any] = ["lang":"en"]
        let headers: HTTPHeaders = [:]
        Request.req(url:"https://etihad.emcan-group.com/api/videos?lang=en", headers: headers, params: params, meth: .get) { [self](data, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            if let data = data {
                do {
                    let videosDecoded = try decoder.decode(VideosModel.self, from: data)
                    videosArray = videosDecoded.payload
                    videosTableView.reloadData()
                    
                } catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}
