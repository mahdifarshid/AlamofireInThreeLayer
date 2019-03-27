//
//  ViewController.swift
//  AlamofireInThreeLayer
//
//  Created by farshid on 27.03.19.
//  Copyright © 2019 com.mahdifarshid.Alamofire. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TableView:UITableView!
    
    var ApiMenuArray = Array<Lang>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let menu = ApiMenuModel(self.view)
        menu.callback = getMenu
        menu.callback = getMenu
//        menu.accessToken = UserDefaults.standard.string(forKey: GlobalNameSpace.ACCESS_TOKEN) // if you have token
        menu.ApiMenu()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func getMenu(array: Array<Lang>) {
        if array.count > 0 {
            self.ApiMenuArray = array
            self.TableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

