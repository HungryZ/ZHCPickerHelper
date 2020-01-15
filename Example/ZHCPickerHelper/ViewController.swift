//
//  ViewController.swift
//  ZHCPickerHelper
//
//  Created by xiaoji520524@163.com on 12/31/2019.
//  Copyright (c) 2019 xiaoji520524@163.com. All rights reserved.
//

import UIKit
import ZHCPickerHelper

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clicked(_ sender: Any) {
//        HGYSinglePickerView().setDataArray(["11", "22"]).show { (index, value) in
//
//        }
        HGYCityPickerView()
    }
}

