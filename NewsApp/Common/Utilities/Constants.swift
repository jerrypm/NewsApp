//
//  Constants.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 05/02/24.
//

import Foundation

typealias SC = StringConstant

enum StringConstant: String {
    // MARK: - Empty & symbol

    case empty = ""
    case space = " "
    case dash = "-"
    case dot = "."
    case coma = ","

    // MARK: - Image assets

    case emptyImage

    var value: String {
        return rawValue
    }
}
