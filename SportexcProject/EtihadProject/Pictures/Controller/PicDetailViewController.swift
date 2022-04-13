//
//  PicDetailViewController.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 12/04/2022.
//

import UIKit
import Alamofire
class PicDetailViewController: UIViewController {
    var id : Int?
    var album : [PicturesDetail] = []
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func picsDetailsApi(){
        let decoder = JSONDecoder()
        let params:[String:Any] = ["lang":"en", "id": id]
        let headers: HTTPHeaders = [:]
        Request.req(url:"httpa://etihad.emcan-group.com/api/images/details?lang=en&id=\(id)", headers: headers, params: params, meth: .get) { [self](data, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            if let data = data {
                do {
                    let picDetailDecoded = try decoder.decode(PicturesDetailModel.self, from: data)
                    album = picDetailDecoded.payload
                } catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}

