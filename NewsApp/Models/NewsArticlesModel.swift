//
//  NewsArticlesModel.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 07/02/24.
//

import Foundation
import SwiftyJSON

struct NewsArticlesModel {
    enum CodingKeys: String, CodingKey {
        case articles, totalResults, status, message
    }

    var articles: [Articles]?
    var totalResults: Int?
    var status: String?
    var message: String?

    init(json: JSON) {
        articles = json[CodingKeys.articles.rawValue].arrayValue.map { Articles(json: $0) }
        totalResults = json[CodingKeys.totalResults.rawValue].int
        status = json[CodingKeys.status.rawValue].string
        message = json[CodingKeys.message.rawValue].string
    }
}

struct Articles {
    enum CodingKeys: String, CodingKey {
        case title, author, source, urlToImage, publishedAt, content, url
        case descriptionValue = "description"
    }

    var title: String?
    var author: String?
    var source: Source?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    var descriptionValue: String?
    var url: String?

    init(json: JSON) {
        title = json[CodingKeys.title.rawValue].string
        author = json[CodingKeys.author.rawValue].string
        source = Source(json: json[CodingKeys.source.rawValue])
        urlToImage = json[CodingKeys.urlToImage.rawValue].string
        publishedAt = json[CodingKeys.publishedAt.rawValue].string
        content = json[CodingKeys.content.rawValue].string
        descriptionValue = json[CodingKeys.descriptionValue.rawValue].string
        url = json[CodingKeys.url.rawValue].string
    }
}

struct Source {
    enum CodingKeys: String, CodingKey {
        case name, id
    }

    var name: String?
    var id: String?

    init(json: JSON) {
        name = json[CodingKeys.name.rawValue].string
        id = json[CodingKeys.id.rawValue].string
    }
}
