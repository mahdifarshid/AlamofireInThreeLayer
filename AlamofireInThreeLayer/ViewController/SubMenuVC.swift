//
// Created by farshid on 2019-03-27.
// Copyright (c) 2019 com.mahdifarshid.Alamofire. All rights reserved.
//

import Foundation
import UIKit

class SubMenuVC:UIViewController{
    var subMenuArray: [SubLang] = []
    @IBOutlet weak var tableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self

    }
}

extension SubMenuVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subMenuArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuCell
        cell.selectionStyle = .none
        cell.lbl_title.text = subMenuArray[indexPath.row].fa
        return  cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
