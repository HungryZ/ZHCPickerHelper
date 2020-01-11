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
        ZHCPickerHelper.show(type: .city(confirmAction: { (a, b, c) in

        }))
//        ZHCPickerHelper.show(type: .date(confirmAction: { (a, b, c) in
//
//        }))
//        ZHCPickerHelper.show(type: .single(dataArray: ["123123", "fsfsf"], confirmAction: { (index, vale) in
//
//        }))
    }
}

