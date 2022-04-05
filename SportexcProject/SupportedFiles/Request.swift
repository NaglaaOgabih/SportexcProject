//
//  Request.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 04/04/2022.
//

import Foundation
import Alamofire

class Request{
    static func req(url: String,headers:HTTPHeaders?, params:[String:Any]?,meth: HTTPMethod, completion:@escaping (Data?,Error?) -> Void) {
        guard  let url = URL(string: url) else {
            print("not valid url")
            return
        }
        AF.request(url,
                   method: meth,
                   parameters: params,
                   encoding: URLEncoding.default,
                   headers: headers).responseDecodable(of: StatusModel.self) { response in
            switch response.result {
                
            case .success( _):
                //                        print(response.value)
                completion(response.data,nil)
                
            case .failure(let error):
                completion(nil,error)
            }
        }
//        AF.request(url,
//                   method: meth,
//                   parameters: params,
//                   encoding: URLEncoding.default,
//                   headers: headers).responseJSON { response in
//            switch response.result {
//
//            case .success( _):
//                //                        print(response.value)
//                completion(response.data,nil)
//
//            case .failure(let error):
//                completion(nil,error)
//            }
//        }
        
    }
}
