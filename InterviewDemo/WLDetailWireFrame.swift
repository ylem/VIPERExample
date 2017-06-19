//
//  WLDetailWireFrameProtocol.swift
//  InterviewDemo
//
//  Created by Wei Lu on 19/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import Foundation
import UIKit

protocol WLDetailWireFrameProtocol: class {
    static func createDemoDetailModule(forBanner banner: WLDashBanner) -> UIViewController
}

class WLDetailWireFrame: WLDetailWireFrameProtocol {

    class func createDemoDetailModule(forBanner banner: WLDashBanner) -> UIViewController {
        if let viewController = mainStoryboard.instantiateViewController(withIdentifier: "WLDetailViewController") as? WLDetailViewController {

            return viewController
        }
        return UIViewController()
    }

    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }

}
