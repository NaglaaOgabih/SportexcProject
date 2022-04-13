//
//  PicturesViewController.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 12/04/2022.
//

import UIKit
import Alamofire

class PicturesViewController: UIViewController {
    var picturesData : [PicData] = []
    @IBOutlet weak var picTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picsApi()
        picTableView.separatorStyle = .none
        
    }
    func picsApi(){
        let decoder = JSONDecoder()
        let params:[String:Any] = ["lang":"en"]
        let headers: HTTPHeaders = [:]
        Request.req(url:"https://etihad.emcan-group.com/api/images?lang=en", headers: headers, params: params, meth: .get) { [self](data, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            if let data = data {
                do {
                    let picDecoded = try decoder.decode(PicturesModel.self, from: data)
                    picturesData = picDecoded.payload
                    picTableView.reloadData()
                } catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}
