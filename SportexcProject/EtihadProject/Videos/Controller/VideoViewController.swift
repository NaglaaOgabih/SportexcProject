//
//  VideoViewController.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 12/04/2022.
//

import UIKit
import Alamofire
import AVFoundation
import AVKit

var videoId : Int?

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
        let lang = Locale.current.languageCode!

        let params:[String:Any] = ["lang":lang]
        let headers: HTTPHeaders = [:]
        Request.req(url:"https://etihad.emcan-group.com/api/videos?lang=\(lang)", headers: headers, params: params, meth: .get) { [self](data, error) in
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
    
    func videosPlayerApi(id : Int){
        let decoder = JSONDecoder()
        let lang = Locale.current.languageCode!
        let params:[String:Any] = ["lang": lang , "id": id]
        let headers: HTTPHeaders = [:]
        Request.req(url:"https://etihad.emcan-group.com/api/videos/details?lang=\(lang)&id=\(id)", headers: headers, params: params, meth: .get) { [self](data, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            if let data = data {
                do {
                    let videoDecoded = try decoder.decode(VideoPlayModel.self, from: data)
                    playViedo(videoString: videoDecoded.payload.video)
                } catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    func playViedo(videoString : String){
        let player = AVPlayer(url: URL(string: videoString)!)
        let playerVc = AVPlayerViewController()
        playerVc.player = player
        self.present(playerVc, animated: true) {
            playerVc.player!.play()
        }
    }
    
}
