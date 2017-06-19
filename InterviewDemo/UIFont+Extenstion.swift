//
//  UIFont+Extenstion.swift
//  InterviewDemo
//
//  Created by Wei Lu on 18/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import UIKit

extension UIFont {

    private static let kFontName                 = "HelveticaNeue"
    private static let kBoldFontName             = "HelveticaNeue-Bold"

    private static let kSmallFontSize: CGFloat   = 14.0
    private static let kRegularFontSize: CGFloat = 18.0
    private static let kLargeFontSize: CGFloat   = 22.0

    var boldRegularFont: UIFont? {
        return UIFont().boldFont(size: UIFont.kRegularFontSize)
    }

    var boldLargeFont: UIFont? {
        return UIFont().boldFont(size: UIFont.kLargeFontSize)
    }

    var boldSmallFont: UIFont? {
        return UIFont().boldFont(size: UIFont.kSmallFontSize)
    }

    var normalRegularFont: UIFont? {
        return UIFont().regularFont(size: UIFont.kRegularFontSize)
    }

    var largeRegularFont: UIFont? {
        return UIFont().regularFont(size: UIFont.kLargeFontSize)
    }

    var smallRegularFont: UIFont? {
        return UIFont().regularFont(size: UIFont.kSmallFontSize)
    }

    private func boldFont(size: CGFloat) -> UIFont? {
        return UIFont(name: UIFont.kBoldFontName, size: size)
    }

    private func regularFont(size: CGFloat) -> UIFont? {
        return UIFont(name: UIFont.kBoldFontName, size: size)
    }
}
