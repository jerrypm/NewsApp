//
//  Constants.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 05/02/24.
//

import Foundation

typealias SC = StringConstant

enum StringConstant: String {
    // MARK: Keys

    static let baseURLNews = "https://newsapi.org/v2/"
    static let apiKey = "apiKey=9f7d91151b7d46d4a3be011aa9878deb"
    static let paramCategory = "category"
    static let paramSource = "source"
    static let paramURL = "web_url"

    // MARK: Other

    static let titleNews = "News Categories"
    
    static let failedText = "Failed"

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
