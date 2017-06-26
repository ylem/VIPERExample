//
//  WLFruitListWorker.swift
//  FruitApp
//
//  Created by Wei Lu on 21/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import Foundation

class WLFruitListWorker: WLFruitListRemoteDataInputProtocol {
    var requestHandler: WLFruitListRemoteDataOutputProtocol?

    func parseResponse(from json: JSON) -> [WLFruit]? {
        var result: [WLFruit]?

        if let jsonArray = json["fruit"] as? [JSON] {
            result = jsonArray.flatMap( WLFruit.init )
        }

        return result
    }

    func startRetrieveFruits() {
        WLNetworkService.shared.GET(urlString: WLConstants.kFruitDataUrl) { (succeed, data) in

            var result: [WLFruit]?

            if  let data     = data,
                let json     = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? JSON,
                let jsonDict = json {

                result = self.parseResponse(from: jsonDict)
            }

            self.requestHandler?.didRetrieveFruits(fruits: result)
        }
    }
}
