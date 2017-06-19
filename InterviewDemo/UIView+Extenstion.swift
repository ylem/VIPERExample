//
//  UIView+Extenstions.swift
//  InterviewDemo
//
//  Created by Wei Lu on 18/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import Foundation
import UIKit

let kIconFontLargeSize: CGFloat   = 32.0
let kIconFontRegularSize: CGFloat = 22.0
let kIconFontSmallSize: CGFloat   = 16.0

protocol SupportIconFontView {
    func iconFont(name: String, size: CGFloat, textColor: UIColor)
}

extension SupportIconFontView where Self: UIView {
    func iconFont(name: String, size: CGFloat, textColor: UIColor) {
        // default
    }
}

extension UILabel: SupportIconFontView {

    func iconFont(name: String, size: CGFloat = kIconFontRegularSize, textColor: UIColor = UIColor.black) {
        guard let font = WLIconFontManager.shared.fontWithSize(size: size),
            let text = WLIconFontManager.shared.iconFontTextByName(name: name)
            else {
                assert(false, "set iocn for uilabel failed")
                return
        }

        self.text      = text
        self.font      = font
        self.textColor = textColor
    }
}

extension UIButton: SupportIconFontView {

    func iconFont(name: String, size: CGFloat = kIconFontRegularSize, textColor: UIColor = UIColor.black) {
        guard let font = WLIconFontManager.shared.fontWithSize(size: size),
            let text = WLIconFontManager.shared.iconFontTextByName(name: name)
            else {
                assert(false, "set iocn for uibutton failed")
                return
        }

        self.titleLabel?.font = font

        self.setTitle(text, for: .normal)
        self.setTitle(text, for: .highlighted)
        self.setTitle(text, for: .disabled)

        self.setTitleColor(textColor, for: .normal)
        self.setTitleColor(textColor, for: .highlighted)
        self.setTitleColor(textColor, for: .disabled)

        self.setImage(nil, for: .normal)
        self.setImage(nil, for: .highlighted)
        self.setImage(nil, for: .disabled)
        
        self.contentVerticalAlignment = .fill
        
    }
}

extension UIButton {
    func dashboardButtonLayout () {
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        self.setTitleColor(.black, for: .normal)
        self.setTitleColor(.black, for: .highlighted)
        self.setTitleColor(.gray, for: .disabled)
    }
}
