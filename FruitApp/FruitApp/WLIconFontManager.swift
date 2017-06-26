//
//  WLIconFontManager.swift
//  FruitApp
//
//  Created by Wei Lu on 23/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import Foundation
import UIKit

struct WLIconFontCharacter {
    let name: String
    let code: String

    init?(name: String, code: String) {
        self.name = name
        self.code = code
    }
}

class WLIconFontManager: NSObject {
    static let shared                      = WLIconFontManager()

    private let kIconFontJsonFileName      = "iconfont"
    private let kIconFontName              = "icomoon"

    var _characters: [WLIconFontCharacter] = []

    override init() {
        super.init()

        assert(self.loadUnicodeConfigFile())
    }

    /**
     * load build-in iconfont list
     */
    private func loadUnicodeConfigFile() -> Bool {
        guard
            let path = Bundle.main.path(forResource: kIconFontJsonFileName, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
            let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
            else {
                return false
        }

        if let json = json as? Array< Dictionary<String, String> > {
            for item in json {
                if let name = item["name"], let code = item["code"] {
                    if let fontChara = WLIconFontCharacter(name: name, code: code) {
                        _characters.append(fontChara)
                    }
                }
            }
        }

        return _characters.count > 0
    }

    /**
     * convert unicode to String
     */
    private func retrieveUnicode(hexCode: String) -> String? {
        let transform       = "Any-Hex/Java"
        let input           = "\\u\(hexCode)" as NSString
        let convertedString = input.mutableCopy() as! NSMutableString

        CFStringTransform(convertedString, nil, transform as NSString, true)
        return String(convertedString)
    }

    /**
     * Get String from given icon font name, the name should be one of `_characters`
     * **Note:** need set font by `-fontWithSize` before ues this function.
     *
     * @param name name of icon
     * @return String of icon font text by name
     */
    public func iconFontTextByName(name: String) -> String? {
        guard let character = _characters.first(where: { $0.name == name }) else {
            return nil
        }

        return retrieveUnicode(hexCode: character.code)
    }

    public func fontWithSize(size: CGFloat) -> UIFont? {
        return UIFont(name: kIconFontName, size: size)
    }
}

