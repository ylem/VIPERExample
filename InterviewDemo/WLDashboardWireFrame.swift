//
//  WLDashWireFrame.swift
//  InterviewDemo
//
//  Created by Wei Lu on 18/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import UIKit

class WLDashboardWireFrame: WLDashboardWireFrameProtocol {

    class func createDashboardModule() -> UIViewController {
        if let viewController = mainStoryboard.instantiateViewController(withIdentifier: "WLDashboardViewController")  as? WLDashboardViewController {
            let presenter: WLDashboardPresenterProtocol & WLDashboardInteractorOutputProtocol        = WLDashboardPresenter()
            let interactor: WLDashboardInteractorInputProtocol & WLDashboardRemoteDataOutputProtocol = WLDashboardInteractor()
            let remoteDataManager: WLDashboardRemoteDataInputProtocol                                = WLDashboardWorker()
            let wireFrame: WLDashboardWireFrameProtocol                                              = WLDashboardWireFrame()

            viewController.presenter               = presenter
            presenter.view                         = viewController
            presenter.wireFrame                    = wireFrame
            presenter.interactor                   = interactor
            interactor.presenter                   = presenter

            interactor.remoteDatamanager           = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor

            return viewController
        }
        
        return UIViewController()
    }

    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }

    func presentDetailScreen(from: WLDashboardViewProtocol, banner: WLDashBanner) {
        let demoDetailViewController = WLDetailWireFrame.createDemoDetailModule(forBanner: banner)

        if let sourceView = from as? UIViewController {
            sourceView.present(demoDetailViewController, animated: true, completion: nil)
        }
    }

}
