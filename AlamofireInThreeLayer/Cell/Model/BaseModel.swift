//
//  MenuModel.swift
//  AlamofireInThreeLayer
//
//  Created by Alireza Sotoudeh on 4/6/19.
//  Copyright © 2019 com.mahdifarshid.Alamofire. All rights reserved.
//

import Foundation
import ObjectMapper

class Lang: BaseResponse {

    var en: String = ""
    var fa: String = ""
    var subArray: [SubLang] = []

    required convenience init?(map: Map) {
        self.init()
    }

    override func mapping(map: Map) {
        super.mapping(map: map)

        en <- map["En"]
        fa <- map["Fa"]
        subArray <- map["SUB"]

    }
}


class SubLang: Mappable {
    var en: String = ""
    var fa: String = ""

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        en <- map["En"]
        fa <- map["Fa"]
    }
}
