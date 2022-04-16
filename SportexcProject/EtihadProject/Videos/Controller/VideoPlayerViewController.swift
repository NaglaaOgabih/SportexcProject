//
//  VideoPlayerViewController.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 16/04/2022.
//

import UIKit
import AVFoundation
import AVKit
import Alamofire

class VideoPlayerViewController: UIViewController {

//    var videoUrlString : String = ""
    var videoId : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        videosPlayerApi()
    }
//    func videosPlayerApi(){
//        let decoder = JSONDecoder()
//        let params:[String:Any] = ["lang":"en" , "id": videoId]
//        let headers: HTTPHeaders = [:]
//        Request.req(url:"https://etihad.emcan-group.com/api/videos/details?lang=en&id=\(videoId)", headers: headers, params: params, meth: .get) { [self](data, error) in
//            if let error = error {
//                print(error.localizedDescription)
//            }
//            if let data = data {
//                do {
//                    let videoDecoded = try decoder.decode(VideoPlayModel.self, from: data)
//                    playVideo(videoString: videoDecoded.payload.video)
//                } catch{
//                    print(error.localizedDescription)
//                }
//            }
//        }
//    }
    func playVideo(videoString: String){
        let player = AVPlayer(url: URL(string: videoString)!)
            let vc = AVPlayerViewController()
            vc.player = player
             present(vc, animated: true)
    }
}
