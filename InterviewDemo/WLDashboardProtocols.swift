//
//  WLDashboardProtocols.swift
//  InterviewDemo
//
//  Created by Wei Lu on 18/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import Foundation
import UIKit

protocol WLDashboardRemoteDataOutputProtocol: class {
    var remoteDatamanager: WLDashboardRemoteDataInputProtocol? { get set }
    
    func onBannersRetrieved(banners: [WLDashBanner]?)
}

protocol WLDashboardWireFrameProtocol: class {
    static func createDashboardModule() -> UIViewController

    func presentDetailScreen(from: WLDashboardViewProtocol, banner: WLDashBanner)
}

protocol WLDashboardViewProtocol: class {
    var presenter: WLDashboardPresenterProtocol? { get set }

    func refreshDashboard(banners: [WLDashBanner])
    func showError()
    func showLoading()
    func hideLoading()
}

protocol WLDashboardPresenterProtocol: class {
    var view: WLDashboardViewProtocol? { get set }
    var interactor: WLDashboardInteractorInputProtocol? { get set }
    var wireFrame: WLDashboardWireFrameProtocol? { get set }

    func viewDidLoad()
    func showBannerLinkedPage(banner: WLDashBanner)
}

protocol WLDashboardInteractorOutputProtocol: class {
    func didFetchBanners(banners: [WLDashBanner]?)
    func onError()
}

protocol WLDashboardInteractorInputProtocol: class {
    var presenter: WLDashboardInteractorOutputProtocol? { get set }
    func fetchBanners()
}

protocol WLDashboardRemoteDataInputProtocol: class {
    var remoteRequestHandler: WLDashboardRemoteDataOutputProtocol? { get set }
    func retrieveBanners()
}

protocol WLDashboardLocalDataInputProtocol: class {
    // NOT IN THIS DEMO
}

