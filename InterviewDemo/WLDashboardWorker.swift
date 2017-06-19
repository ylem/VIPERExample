//
//  DashboardWorker.swift
//  InterviewDemo
//
//  Created by Wei Lu on 18/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import Foundation
import UIKit

let kBannerJsonEndpoint = "https://www.prettylittlething.com/ajaxbanners/getJson.php"
let kImgEndpoint        = "https://cdn-media.prettylittlething.com/"

class WLDashboardWorker: WLDashboardRemoteDataInputProtocol {

    var remoteRequestHandler: WLDashboardRemoteDataOutputProtocol?

    func retrieveBanners() {
        WLNetworkManager.shared.GET(urlString: "\(kBannerJsonEndpoint)") { (succeed, data) in
            var result: [WLDashBanner] = []

            if let data = data {
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? JSON,
                    let jsonDict = json {
                    for item in jsonDict.enumerated() {
                        // Demo data
                        if item.element.key.contains("banner-pltstyle") {
                            if let content = item.element.value as? [JSON] {
                                let obj = content.flatMap(WLDashBanner.init)
                                result.append(contentsOf: obj)
                            }
                        }
                    }
                }
            }

            debugPrint("WLDashBanner count = \(result.count)")

            self.remoteRequestHandler?.onBannersRetrieved(banners: result)
        }
    }
}
