//
//  WLFruitWireFrame.swift
//  FruitApp
//
//  Created by Wei Lu on 22/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import Foundation
import UIKit

class WLFruitDetailWireFrame: WLFruitDetailWireFrameProtocol {

    class func createFruitDetailModule(for fruit: WLFruit) -> UIViewController? {
        guard
            let vc = UIStoryboard.viewController(identifier: "WLFruitDetailViewController") as? WLFruitDetailViewController
            else {
                return nil
        }

        let presenter: WLFruitDetailPresenterProtocol = WLFruitDetailPresenter()
        let wireFrame: WLFruitDetailWireFrameProtocol = WLFruitDetailWireFrame()

        vc.presenter                                  = presenter
        presenter.view                                = vc
        presenter.wireFrame                           = wireFrame
        presenter.fruit                               = fruit
        
        return vc
    }
}
