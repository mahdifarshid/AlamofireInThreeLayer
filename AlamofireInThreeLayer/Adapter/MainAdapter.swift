//
// Created by farshid on 2019-03-27.
// Copyright (c) 2019 com.mahdifarshid.Alamofire. All rights reserved.
//

import Foundation
import UIKit

extension MainVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.apiMenuArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuCell
        cell.selectionStyle = .none
        cell.lbl_title.text = self.apiMenuArray[indexPath.row].Fa
        return  cell
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SubMenuVC") as? SubMenuVC
        if let control = controller {
            control.subMenuArray = self.apiMenuArray[indexPath.row].SUBArray
            self.navigationController!.pushViewController(control, animated: true)
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
