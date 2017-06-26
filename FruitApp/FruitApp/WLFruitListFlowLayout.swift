//
//  WLFruitListFlowLayout.swift
//  FruitApp
//
//  Created by Wei Lu on 22/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import Foundation
import UIKit

class WLFruitListFlowLayout: UICollectionViewFlowLayout {

    init(itemSize: CGSize) {
        super.init()
        self.itemSize      = itemSize
        scrollDirection    = .vertical
        minimumLineSpacing = 5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // more layout config
}
