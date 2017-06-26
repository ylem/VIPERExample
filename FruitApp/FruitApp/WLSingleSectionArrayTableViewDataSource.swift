//
//  WLArrayTableViewDataSource.swift
//  FruitApp
//
//  Created by Wei Lu on 22/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import Foundation
import UIKit

class WLSingleSectionArrayTableViewDataSource <T>: NSObject, UITableViewDataSource {

    var items: [T]
    var cellIdentifier: String
    var cellConfigureCallBack: ((UITableViewCell, T) -> Void)

    init(items:[T], cellIdentifier: String, cellConfigureCallBack: @escaping (UITableViewCell, T) -> Void) {
        self.items                 = items
        self.cellIdentifier        = cellIdentifier
        self.cellConfigureCallBack = cellConfigureCallBack

        super.init()
    }

    func itemAt(indexPath: IndexPath) -> T? {
        return items[indexPath.row]
    }

    // MARK: - UITableViewDatasource

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        if let item = itemAt(indexPath: indexPath) {
            cellConfigureCallBack(cell, item)
        }

        return cell
    }
}
