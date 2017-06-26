//
//  WLBaseViewController.swift
//  FruitApp
//
//  Created by Wei Lu on 22/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import UIKit

class WLBaseViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    open func justDismissMe() {
        self.dismiss(animated: true, completion: nil)
    }
}
