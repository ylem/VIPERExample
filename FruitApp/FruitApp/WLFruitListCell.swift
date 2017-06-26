//
//  WLFruitListCell.swift
//  FruitApp
//
//  Created by Wei Lu on 22/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import UIKit

class WLFruitListCell: UICollectionViewCell {

    @IBOutlet weak var typeIconView: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        self.backgroundColor    = .clear
        self.layer.cornerRadius = 10.0
        self.layer.borderColor  = UIColor.red.cgColor
        self.layer.borderWidth  = 2.0
    }

    func bindData(viewModel: WLFruitViewModel) {
        typeIconView.image = viewModel.typeImg
        typeLabel.text     = viewModel.typeStr
        priceLabel.text    = "price: £\(viewModel.priceStr)"
        weightLabel.text   = "weight: \(viewModel.weightStr) kg"
    }

}
