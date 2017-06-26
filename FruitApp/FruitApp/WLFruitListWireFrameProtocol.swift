//
//  WLFruitListWireFrameProtocol.swift
//  FruitApp
//
//  Created by Wei Lu on 21/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import Foundation
import UIKit

protocol WLFruitListWireFrameProtocol: class {
    static func createFruitListModule() -> UIViewController?

    func go2DetailScreen(from: WLFruitListViewProtocol?, fruit: WLFruit?)
}

protocol WLFruitListViewProtocol: class {
    var presenter: WLFruitListPresenterProtocol? { get set }

    func showList(fruits: [WLFruit]?)
    func showError()
    func showLoading()
    func hideLoading()
}

protocol WLFruitListPresenterProtocol: class {
    var view: WLFruitListViewProtocol? { get set }
    var wireFrame: WLFruitListWireFrameProtocol? { get set }
    var interactor: WLFruitListInteractorInputProtocol? { get set }

    func viewDidLoad()
    func refreshListData()
    
    func showDetailPage(fruit: WLFruit?)
}

protocol WLFruitListInteractorInputProtocol: class {
    var presenter: WLFruitListInteractorOutputProtocol? { get set }
    var remoteDataHandler: WLFruitListRemoteDataInputProtocol? { get set }

    func startFetchFruits()
}

protocol WLFruitListInteractorOutputProtocol: class {
    func didFetchFruits(fruits: [WLFruit]?)
    func onError()
}

protocol WLFruitListRemoteDataInputProtocol: class {
    var requestHandler: WLFruitListRemoteDataOutputProtocol? { get set }

    func startRetrieveFruits()
}

protocol WLFruitListRemoteDataOutputProtocol: class {
    var remoteDataHandler: WLFruitListRemoteDataInputProtocol? { get set }

    func didRetrieveFruits(fruits: [WLFruit]?)
}
