//
//  WLDashboardPresenter.swift
//  InterviewDemo
//
//  Created by Wei Lu on 18/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import UIKit

class WLDashboardPresenter: WLDashboardPresenterProtocol {
    weak var view: WLDashboardViewProtocol?
    var interactor: WLDashboardInteractorInputProtocol?
    var wireFrame: WLDashboardWireFrameProtocol?

    func viewDidLoad() {
        view?.showLoading()
        interactor?.fetchBanners()
    }

    func showBannerLinkedPage(banner: WLDashBanner) {
        wireFrame?.presentDetailScreen(from: view!, banner: banner)
    }
}

extension WLDashboardPresenter: WLDashboardInteractorOutputProtocol {

    func didFetchBanners(banners: [WLDashBanner]?) {
        view?.hideLoading()

        if let banners = banners {
            view?.refreshDashboard(banners: banners)
        } else {
            onError()
        }
    }

    func onError() {
        view?.hideLoading()
        view?.showError()
    }
}
