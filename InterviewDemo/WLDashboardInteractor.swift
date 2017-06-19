//
//  WLDashboardInteractor.swift
//  InterviewDemo
//
//  Created by Wei Lu on 18/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import Foundation
import UIKit

class WLDashboardInteractor: WLDashboardInteractorInputProtocol, WLDashboardRemoteDataOutputProtocol {

    weak var presenter: WLDashboardInteractorOutputProtocol?
    var remoteDatamanager: WLDashboardRemoteDataInputProtocol?

    var _banners: [WLDashBanner]?

    // MARK: - WLDashboardInteractorInputProtocol

    weak var _presenter: WLDashboardInteractorOutputProtocol?

    func fetchBanners() {
        // TODO: need check for local cache before request from remote.
        // but no time for demo :)

        remoteDatamanager?.retrieveBanners()
    }

    func onBannersRetrieved(banners: [WLDashBanner]?) {
        presenter?.didFetchBanners(banners: banners)
    }
}
