//
//  CategoriesEnum.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 07/02/24.
//

import Foundation

// MARK: Category News

enum CategoryState: String, CaseIterable {
    case general
    case business
    case entertainment
    case health
    case science
    case sports
    case technology

    var value: String {
        return rawValue
    }
}
