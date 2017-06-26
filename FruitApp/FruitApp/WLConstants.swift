//
//  kConstant.swift
//  FruitApp
//
//  Created by Wei Lu on 24/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import UIKit

struct WLConstants {

    private static let kBaseUrl         = "http://localhost:3000/"
    private static let kFruitDataUrlArg = "fruitlist"

    static var kFruitDataUrl: String {
        return "\(kBaseUrl)\(kFruitDataUrlArg)"
    }
}
