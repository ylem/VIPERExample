//
//  WLFruitDetailPresenter.swift
//  FruitApp
//
//  Created by Wei Lu on 22/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import Foundation

class WLFruitDetailPresenter: WLFruitDetailPresenterProtocol {
    weak var view: WLFruitDetailViewProtocol?
    var wireFrame: WLFruitDetailWireFrameProtocol?

    var fruit: WLFruit?

    func viewDidLoad() {
        if let fruit = fruit {
            view?.showDetail(for: fruit)
        } else {
            // show error
        }
    }
}
