//
//  WLFruitListInteractor.swift
//  FruitApp
//
//  Created by Wei Lu on 21/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import Foundation

class WLFruitListInteractor: WLFruitListInteractorInputProtocol {
    weak var presenter: WLFruitListInteractorOutputProtocol?
    var remoteDataHandler: WLFruitListRemoteDataInputProtocol?

    var fruits: [WLFruit]?

    func startFetchFruits() {
        remoteDataHandler?.startRetrieveFruits()
    }
}

extension WLFruitListInteractor: WLFruitListRemoteDataOutputProtocol {

    func didRetrieveFruits(fruits: [WLFruit]?) {
        if fruits == nil || fruits?.count == 0 {
            presenter?.onError()
        }

        presenter?.didFetchFruits(fruits: fruits)
    }
}
