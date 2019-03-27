//
// Created by farshid on 2019-03-27.
// Copyright (c) 2019 com.mahdifarshid.Alamofire. All rights reserved.
//

import Foundation
import SwiftyJSON

class Lang {
    var En: String = ""
    var Fa: String = ""
    var SUBArray = Array<SubLang>()
}

class SubLang {
    var En: String = ""
    var Fa: String = ""
}

class ApiMenuModel: BaseModel {
    var callback: ((Array<Lang>) -> Void)!
    var LangArray = Array<Lang>()

    func ApiMenu() {
        let service = APIService(self.view!)
        service.callback = ApiMenuResponse
        service.url = "/github/AlamofireThreeLayer/"
        service.AlamofireGetRequest()
    }

    func ApiMenuResponse(json: JSON) {
        for lang in json.arrayValue {
            let langModel = Lang()
            langModel.En = lang["En"].string ?? ""
            langModel.Fa = lang["Fa"].string ?? ""
            for subLang in lang["SUB"].arrayValue {
                let SubLangModel = SubLang()
                SubLangModel.En = subLang["En"].string ?? ""
                SubLangModel.Fa = subLang["Fa"].string ?? ""
                langModel.SUBArray.append(SubLangModel)
            }
            self.LangArray.append(langModel)
        }
        self.callback(self.LangArray)

    }
}
