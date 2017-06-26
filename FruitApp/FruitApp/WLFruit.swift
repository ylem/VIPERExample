//
//  WLFruit.swift
//  FruitApp
//
//  Created by Wei Lu on 21/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import Foundation
import UIKit

struct WLFruit {
    let type: String

    // save as String to make it format easier
    let price: String
    let weight: String
}

extension WLFruit {
    init? (json: JSON) {
        guard
            let type = json["type"] as? String,
            let price = json["price"] as? Int,
            let weight = json["weight"] as? Int
        else {
            return nil
        }

        self.type   = type
        self.price  = "\(price)"
        self.weight = "\(weight)"
    }
}

struct WLFruitViewModel {

    let priceStr: String
    let weightStr: String
    let typeStr: String
    let typeImg: UIImage?

    init? (fruit: WLFruit?) {
        guard
            let fruit     = fruit,
            let priceVal  = Float(fruit.price),
            let weightVal = Float(fruit.weight)
        else {
            return nil
        }

        priceStr  = String(format: "%0.2f", (priceVal / Float(100.0)))
        weightStr = String(format: "%0.2f", (weightVal / Float(1000.0)))
        typeStr   = fruit.type
        typeImg   = UIImage(named: fruit.type) ?? UIImage(named: "unknown_fruit")
    }
}

