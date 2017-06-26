//
//  WLFruitDetailViewController.swift
//  FruitApp
//
//  Created by Wei Lu on 22/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import UIKit

class WLFruitDetailViewController: WLBaseViewController {

    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!

    var presenter: WLFruitDetailPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.appOrange

        dismissButton.iconFont(name: "circle-down")
        dismissButton.addTarget(self, action: #selector(super.justDismissMe), for: .touchUpInside)

        presenter?.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateLayout(by fruit: WLFruit) {
        if  let viewModel = WLFruitViewModel(fruit: fruit) {
            priceLabel.text      = "Price: £ \(viewModel.priceStr)"
            weightLabel.text     = "Weight: \(viewModel.weightStr) kg"
            titleImageView.image = viewModel.typeImg
            titleLabel.text      = viewModel.typeStr
        }
    }
}

extension WLFruitDetailViewController: WLFruitDetailViewProtocol {

    func showDetail(for fruit: WLFruit) {
        updateLayout(by: fruit)
    }
}

extension WLFruitDetailViewController: UIViewControllerTransitioningDelegate, WLMoveImageTransitionProtocol {

    func didTransitionBegin() {
        titleImageView.isHidden = true
    }

    func didTransitionEnd() {
        titleImageView.isHidden = false
    }

    func sourceImageView() -> UIImageView? {
        let frame    = view.convert(titleImageView.frame, from: view)
        let result   = UIImageView(frame: frame)
        result.image = titleImageView.image
        return result
    }
}
