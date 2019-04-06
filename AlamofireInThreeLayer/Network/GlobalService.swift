//
//  GlobalService.swift
//  AlamofireInThreeLayer
//
//  Created by Alireza Sotoudeh on 4/6/19.
//  Copyright © 2019 com.mahdifarshid.Alamofire. All rights reserved.
//

import Foundation
import Alamofire

final class GlobalService {
    static let instance = GlobalService();
    fileprivate init() {
    }

    func getMenuList(callBack: ((_ res: [Lang]) -> Void)?) {
        let url = APIService.shared.getAppUrl(url: "/github/AlamofireThreeLayer/")
        APIService.shared.GET(url, callback: callBack, headers: headers)
    }

    // for example in Post Api ... --->
    func postSmt(parameters: Parameters, callBack: ((_ res: [Lang]) -> Void)?) {
        let url = APIService.shared.getAppUrl(url: "smt...")
        APIService.shared.POST(url, parameters: parameters, callback: callBack, headers: headers)
    }

}
