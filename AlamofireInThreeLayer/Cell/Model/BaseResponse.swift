//
//  BaseResponse.swift
//  AlamofireInThreeLayer
//
//  Created by Alireza Sotoudeh on 4/6/19.
//  Copyright © 2019 com.mahdifarshid.Alamofire. All rights reserved.
//

import Foundation
import ObjectMapper

class BaseResponse: Mappable {

    required init() {
    }

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
    }
}
