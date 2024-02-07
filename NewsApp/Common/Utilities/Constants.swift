//
//  Constants.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 05/02/24.
//

import Foundation

typealias SC = StringConstant

enum StringConstant: String {
    
    static let baseURLNews = "https://newsapi.org/v2/"
    static let apiKey = "apiKey=9f7d91151b7d46d4a3be011aa9878deb"
    
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
