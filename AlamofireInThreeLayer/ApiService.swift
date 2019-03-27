//
//  ApiService.swift
//  Jazire
//
//  Created by farshid on 11/26/18.
//  Copyright © 2019 com.mahdifarshid.Alamofire. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class APIService {
    
    var url: String = ""
    var accessToken: String = ""
    var postJSON = [String: Any]()

    var callback: ((JSON) -> Void)!
    var view: UIView!
    
    init(_ view: UIView) {
        self.view = view
    }


    func AlamofireGetRequest() {
        self.url = self.url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        print("\(GlobalNameSpace.BASEURL)\(self.url)")
        let headers = ["Authorization": "Bearer " + accessToken + "",
                       "Content-Type": "application/json"]

        Alamofire.request("\(GlobalNameSpace.BASEURL)\(self.url)", headers: headers).responseJSON { (responseData) -> Void in
            switch responseData.result {
            case .success(let value):
                let swiftyJsonVar = JSON(responseData.result.value!)
                if responseData.response?.statusCode == 401 {
                } else if responseData.response?.statusCode == 400 {
                    Toast.Make(self.view, String(describing: swiftyJsonVar["message"]), 3.0)
                    self.callback(JSON())
                } else if responseData.response?.statusCode == 500 {
                    Toast.Make(self.view, String(describing: swiftyJsonVar["message"]), 3.0)
                    self.callback(JSON())
                } else {
                    self.callback(swiftyJsonVar)
                }
            case .failure(let error):
                self.callback(JSON())
            }
        }
    }


    func AlamofirePostRequest() {
        self.url = self.url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        print("\(GlobalNameSpace.BASEURL)\(self.url)")
        let headers = ["Authorization": "Bearer " + accessToken + "",
                       "Content-Type": "application/json"]

        Alamofire.request("\(GlobalNameSpace.BASEURL)\(self.url)", method: .post, parameters: self.postJSON, encoding: JSONEncoding.default, headers: headers).responseJSON
            { (response: DataResponse) in
                let swiftyJsonVar = JSON(response.result.value ?? nil)

                switch response.result {
                case .success(let value):
                    let swiftyJsonVar = JSON(response.result.value ?? nil)
                    if response.response?.statusCode == 401 {
                    } else if response.response?.statusCode == 400 {
                        Toast.Make(self.view, String(describing: swiftyJsonVar["message"]), 3.0)
                        self.callback(JSON())
                    } else if response.response?.statusCode == 500 {
                        Toast.Make(self.view, String(describing: swiftyJsonVar["message"]), 3.0)
                        self.callback(JSON())
                    } else {
                        self.callback(swiftyJsonVar)
                    }
                case .failure(let error):
                    print(error)
                    self.callback(JSON())
                }
        }
        
    }
    

    func AlamofireDeleteRequest() {
        self.url = self.url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        let headers = ["Authorization": "Bearer " + accessToken + "",
                       "Content-Type": "application/json"]
        
        Alamofire.request("\(GlobalNameSpace.BASEURL)\(self.url)", method: .delete, headers: headers)
            .responseJSON { response in
                let swiftyJsonVar = JSON(response.result.value!)
                if response.response?.statusCode == 401 {
                } else if response.response?.statusCode == 400 {
                    Toast.Make(self.view, String(describing: swiftyJsonVar["message"]), 3.0)
                    self.callback(JSON())
                } else if response.response?.statusCode == 500 {
                    Toast.Make(self.view, String(describing: swiftyJsonVar["message"]), 3.0)
                    self.callback(JSON())
                } else {
                    self.callback(swiftyJsonVar)
                }
                print(response)
        }
    }
}

