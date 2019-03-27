//
// Created by farshid on 2018-12-24.
// Copyright (c) 2018 com.arkadevelope.jazire. All rights reserved.
//

import Foundation
import UIKit
import Toast_Swift

class Toast{
    static func Make(_ view:UIView,_ text:String,_ duration:Double) {
        var style = ToastStyle()
        style.messageColor = .white
        style.backgroundColor = .gray
        style.cornerRadius = 20
        style.horizontalPadding = 20
        style.verticalPadding = 13
        view.makeToast(text, duration: duration, position: .bottom, style: style)
    }

}
