//
//  WLFruitDetailProtocol.swift
//  FruitApp
//
//  Created by Wei Lu on 22/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import Foundation
import UIKit

protocol WLFruitDetailWireFrameProtocol: class {

    static func createFruitDetailModule(for fruit: WLFruit) -> UIViewController?

}

protocol WLFruitDetailViewProtocol: class {
    var presenter: WLFruitDetailPresenterProtocol? { get set }

    func showDetail(for fruit: WLFruit)
}

protocol WLFruitDetailPresenterProtocol: class {
    var view: WLFruitDetailViewProtocol? { get set }
    var wireFrame: WLFruitDetailWireFrameProtocol? { get set }
    var fruit: WLFruit? { get set }

    func viewDidLoad()
}
