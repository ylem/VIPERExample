//
//  WLFruitListWireFrame.swift
//  FruitApp
//
//  Created by Wei Lu on 21/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import Foundation
import UIKit

class WLFruitListWireFrame: WLFruitListWireFrameProtocol {

    class func createFruitListModule() -> UIViewController? {
        guard
            let vc = UIStoryboard.viewController(identifier: "WLFruitListViewController") as? WLFruitListViewController
        else {
            return nil
        }

        let presenter: WLFruitListPresenterProtocol & WLFruitListInteractorOutputProtocol        = WLFruitListPresenter()
        let interactor: WLFruitListInteractorInputProtocol & WLFruitListRemoteDataOutputProtocol = WLFruitListInteractor()
        let worker: WLFruitListRemoteDataInputProtocol                                           = WLFruitListWorker()
        let wireFrame: WLFruitListWireFrameProtocol                                              = WLFruitListWireFrame()

        vc.presenter                 = presenter
        presenter.view               = vc
        presenter.wireFrame          = wireFrame
        presenter.interactor         = interactor
        interactor.presenter         = presenter
        interactor.remoteDataHandler = worker
        worker.requestHandler        = interactor

        return vc
    }

    func go2DetailScreen(from: WLFruitListViewProtocol?, fruit: WLFruit?) {
        guard let from = from, let fruit = fruit else {
            debugPrint("go2DetailScreen - empty args")
            return
        }

        if let fruitDetailViewController = WLFruitDetailWireFrame.createFruitDetailModule(for: fruit) {
            if let sourceView = from as? UIViewController {
                fruitDetailViewController.transitioningDelegate = sourceView as? UIViewControllerTransitioningDelegate
                sourceView.present(fruitDetailViewController, animated: true, completion: nil)
            }
        }
    }
}
