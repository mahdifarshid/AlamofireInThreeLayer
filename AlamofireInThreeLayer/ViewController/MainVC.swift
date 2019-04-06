//
//  MainVC.swift
//  AlamofireInThreeLayer
//
//  Created by farshid on 27.03.19.
//  Copyright © 2019 com.mahdifarshid.Alamofire. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var tableView:UITableView!

    var menuList: [Lang] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white

        self.tableView.delegate = self
        self.tableView.dataSource = self

//        menu.accessToken = UserDefaults.standard.string(forKey: GlobalNameSpace.ACCESS_TOKEN) // if you have token
        callAPI()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func callAPI() {
        GlobalService.instance.getMenuList { [weak self] (_ res: [Lang]) in
            // if success ( your server status code? )
            self?.menuList = res
            self?.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension MainVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuCell
        cell.selectionStyle = .none
        let data = menuList[indexPath.row]
        cell.lbl_title.text = data.fa
        return  cell
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SubMenuVC") as? SubMenuVC
        if let control = controller {
            control.subMenuArray = menuList[indexPath.row].subArray
            self.navigationController!.pushViewController(control, animated: true)
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
