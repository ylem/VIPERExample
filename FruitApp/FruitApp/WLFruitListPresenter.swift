//
//  WLFruitListPresenter.swift
//  FruitApp
//
//  Created by Wei Lu on 21/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import Foundation

class WLFruitListPresenter: WLFruitListPresenterProtocol {
    weak var view: WLFruitListViewProtocol?
    var interactor: WLFruitListInteractorInputProtocol?
    var wireFrame: WLFruitListWireFrameProtocol?

    func viewDidLoad() {
        view?.showLoading()
        refreshListData()
    }

    func showDetailPage(fruit: WLFruit?) {
        if let view = view {
            wireFrame?.go2DetailScreen(from: view, fruit: fruit)
        }
    }

    func refreshListData() {
        interactor?.startFetchFruits()
    }
}

extension WLFruitListPresenter: WLFruitListInteractorOutputProtocol {


    func didFetchFruits(fruits: [WLFruit]?) {
        view?.hideLoading()

        guard let fruits = fruits else {
            onError()
            return
        }

        view?.showList(fruits: fruits)
    }

    func onError() {
        view?.hideLoading()
        view?.showError()
    }

}
