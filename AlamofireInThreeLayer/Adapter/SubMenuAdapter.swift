//
// Created by farshid on 2019-03-27.
// Copyright (c) 2019 com.mahdifarshid.Alamofire. All rights reserved.
//

import Foundation
import UIKit

extension SubMenuVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.subMenuArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuCell
        cell.selectionStyle = .none
        cell.lbl_title.text = self.subMenuArray[indexPath.row].Fa
        return  cell
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
