//
//  WLDashCardCell.swift
//  InterviewDemo
//
//  Created by Wei Lu on 18/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import UIKit
import SDWebImage

class WLDashCardCell: UITableViewCell {

    @IBOutlet weak var go2Button: UIButton!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()

        go2Button.dashboardButtonLayout()

        titleLabel.text             = nil
        subTitleLabel.text          = nil

        titleLabel.font             = UIFont().boldLargeFont
        subTitleLabel.font          = UIFont().normalRegularFont
    }

    func bandData(entity: WLDashBanner) {
        go2Button.setTitle(entity.subTitle, for: .normal)
        go2Button.setTitle(entity.subTitle, for: .highlighted)
        go2Button.setTitle(entity.subTitle, for: .disabled)

        titleLabel.text    = entity.bannerTitle
        subTitleLabel.text = entity.mainText
    }
}
