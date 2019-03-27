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
    
    var apiMenuArray = Array<Lang>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white

        self.tableView.delegate = self
        self.tableView.dataSource = self

        let menu = ApiMenuModel(self.view)
        menu.callback = getMenu
        menu.callback = getMenu
//        menu.accessToken = UserDefaults.standard.string(forKey: GlobalNameSpace.ACCESS_TOKEN) // if you have token
        menu.ApiMenu()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func getMenu(array: Array<Lang>) {
        if array.count > 0 {
            self.apiMenuArray = array
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

