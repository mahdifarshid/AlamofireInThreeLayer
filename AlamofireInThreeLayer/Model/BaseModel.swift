//
// Created by farshid on 2019-03-27.
// Copyright (c) 2019 com.mahdifarshid.Alamofire. All rights reserved.
//


import Foundation
import UIKit

class BaseModel{
    var view: UIView?
    var accessToken : String?
    init(_ view: UIView) {
        self.view = view
    }

    init() {

    }
}
