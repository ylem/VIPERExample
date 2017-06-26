//
//  UIStoryboard+Extension.swift
//  FruitApp
//
//  Created by Wei Lu on 21/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {

    static let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)

    class func viewController(identifier: String) -> UIViewController? {
        return UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier:identifier)
    }
}
