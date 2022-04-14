//
//  PicDetailViewController.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 12/04/2022.
//

import UIKit
import Alamofire

class PicDetailViewController: UIViewController {
    var picId : Int = 0
    var album : [PicturesDetail] = []
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        picsDetailsApi()
    }
    
    func picsDetailsApi(){
        let decoder = JSONDecoder()
        let params:[String:Any] = ["lang":"en", "id": picId]
        let headers: HTTPHeaders = [:]
        Request.req(url:"https://etihad.emcan-group.com/api/images/details?lang=en&id=\(picId)", headers: headers, params: params, meth: .get) { [self](data, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            if let data = data {
                do {
                    let picDetailDecoded = try decoder.decode(PicturesDetailModel.self, from: data)
                    album = picDetailDecoded.payload
                    imagesCollectionView.reloadData()
                } catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}

