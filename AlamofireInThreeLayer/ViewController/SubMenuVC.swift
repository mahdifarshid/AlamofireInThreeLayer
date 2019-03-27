//
// Created by farshid on 2019-03-27.
// Copyright (c) 2019 com.mahdifarshid.Alamofire. All rights reserved.
//

import Foundation
import UIKit

class SubMenuVC:UIViewController{
    var subMenuArray = Array<SubLang>()
    @IBOutlet weak var tableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self

    }
}