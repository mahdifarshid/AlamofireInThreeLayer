//
//  ApiService.swift
//  Jazire
//
//  Created by farshid on 11/26/18.
//  Copyright © 2019 com.mahdifarshid.Alamofire. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

var headers: HTTPHeaders = ["Content-Type": "application/json"]

class APIService {

    static let shared = APIService()


    enum typeCheck {
        case network
        case serverError
        case responseError
    }

    var networkStatus: EnumNetworkStatus = .notReachable

    func networkStatus(completion: (_ callbackStatus: EnumNetworkStatus) -> Void) {
        completion(networkStatus)
    }

    func updateHeaders() {
        headers = [
            "Content-Type": "application/x-www-form-urlencoded",
            "Authorization": "bearer \(GlobalNameSpace.ACCESS_TOKEN)"
        ]
    }

    func getAppUrl(url: String) -> URL{
        return URL(string: GlobalNameSpace.BASEURL + url)!
    }

    func controlErrorMessages(type: typeCheck, contentMessage: String) {
        switch type {
        case .network:
            // Check Internet Connection
            if networkStatus == .notReachable || networkStatus == .unknown {
                Toast.Make("Smt ...", 3.0)
            }
        case .serverError:
            Toast.Make("Smt ...", 3.0)
            return
        case .responseError:
            Toast.Make(contentMessage, 3.0)
        }
    }

    func POST<T: BaseResponse>(_ url: URL, parameters: [String: Any]?, callback: ((_ res: [T]) -> Void)?, headers: [String:String]?) {
        guard let safeCallBack = callback else { return }
        self.Request(.post, url: url, parameters: parameters, callback: safeCallBack, headers: headers);
    }

    func GET<T: BaseResponse>(_ url: URL, callback: ((_ res: [T]) -> Void)?, headers: [String:String]?) {
        guard let safeCallBack = callback else { return }
        self.Request(.get, url: url, callback: safeCallBack, headers: headers);
    }

    func DELETE<T: BaseResponse>(_ url: URL, callback: ((_ res: [T]) -> Void)?, headers: [String:String]?) {
        guard let safeCallBack = callback else { return }
        self.Request(.delete, url: url, callback: safeCallBack, headers: headers);
    }

    func PUT<T: BaseResponse>(_ url: URL, parameters: [String: Any]?, callback: ((_ res: [T]) -> Void)?, headers: [String:String]?) {
        guard let safeCallBack = callback else { return }
        self.Request(.put, url: url, parameters: parameters, callback: safeCallBack, headers: headers);
    }


    func Request<T: BaseResponse>(_ call_method: Alamofire.HTTPMethod, url: URL, parameters: [String: Any]? = nil, callback: @escaping(_ res: [T]) -> Void?, headers: [String: String]?) {

        Alamofire
                .request(url, method: call_method, parameters: parameters, encoding: URLEncoding() , headers: headers)
                .responseArray { [weak self] (response: DataResponse<[T]>) in

                    switch response.result {

                    case .success(let data):

                        callback(data )

                    case .failure(let error):
                        if NetworkReachabilityManager()!.isReachable {
                            self?.controlErrorMessages(type: .serverError, contentMessage: "")
                        } else {
                            self?.controlErrorMessages(type: .responseError, contentMessage: "عدم دسترسی به اینترنت")
                        }
                    }
                }
    }

}

