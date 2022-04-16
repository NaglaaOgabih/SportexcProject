//
//  DescriptionViewController.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 12/04/2022.
//

import UIKit
import Alamofire
import Kingfisher
class DescriptionViewController: UIViewController {

    @IBOutlet weak var descriptionImgView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var newsId : Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        newsDetailsApi()
        // Do any additional setup after loading the view.
    }
    
    func newsDetailsApi(){
        let decoder = JSONDecoder()
        let lang = Locale.current.languageCode!

        let params:[String:Any] = ["lang": lang , "id": newsId ]
        let headers: HTTPHeaders = [:]
        Request.req(url:"https://etihad.emcan-group.com/api/news?lang=\(lang)&id=\(newsId)", headers: headers, params: params, meth: .get) { [self](data, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            if let data = data {
                do {
                    let detailsDecoded = try decoder.decode(NewsDetailModel.self, from: data)
                    let url = URL(string: detailsDecoded.payload?.image ?? "")
                    descriptionImgView.kf.setImage(with: url)
                    dateLabel.text = detailsDecoded.payload?.date
                    titleLabel.text = detailsDecoded.payload?.title
                    descriptionLabel.text = detailsDecoded.payload?.desc
                    
                    
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}
