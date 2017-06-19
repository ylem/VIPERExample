//
//  DashBanner.swift
//  InterviewDemo
//
//  Created by Wei Lu on 18/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import Foundation

struct WLDashBanner {
    let blockId: String?
    let imageName: String?
    let bannerTitle: String?
    let subTitle: String?
    let mainText: String?
}

extension WLDashBanner {

    init? (json: JSON) {
        guard
            let id = json["block_id"] as? String,
            let title = json["banner_title"] as? String,
            let imgName = json["filename"] as? String
        else {
                return nil
        }

        self.blockId     = id
        self.bannerTitle = title
        self.imageName   = imgName
        self.subTitle    = json["sub_text"] as? String
        self.mainText    = json["main_text"] as? String
    }
}
