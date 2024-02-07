//
//  NewsSourcesModel.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 07/02/24.
//

import Foundation
import SwiftyJSON

struct NewsSourcesModel {
    enum CodingKeys: String, CodingKey {
        case sources, status, message
    }

    var sources: [Sources]?
    var status: String?
    var message: String?

    init(json: JSON) {
        sources = json[CodingKeys.sources.rawValue].arrayValue.map { Sources(json: $0) }
        status = json[CodingKeys.status.rawValue].stringValue
        message = json[CodingKeys.message.rawValue].stringValue
    }
}

struct Sources {
    enum CodingKeys: String, CodingKey {
        case country, id, category, url, language, name
        case descriptionValue = "description"
    }

    var country: String?
    var id: String?
    var category: String?
    var descriptionValue: String?
    var url: String?
    var language: String?
    var name: String?

    init(json: JSON) {
        country = json[CodingKeys.country.rawValue].string
        id = json[CodingKeys.id.rawValue].string
        category = json[CodingKeys.category.rawValue].string
        descriptionValue = json[CodingKeys.descriptionValue.rawValue].string
        url = json[CodingKeys.url.rawValue].string
        language = json[CodingKeys.language.rawValue].string
        name = json[CodingKeys.name.rawValue].string
    }
}
