//
//  Endpoint.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 05/02/24.
//

import Alamofire
import Foundation

protocol IEndpoint {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameter: Parameters? { get }
    var header: HTTPHeaders? { get }
    var encoding: ParameterEncoding { get }
}

enum NewsEndpoint {
    case getNewsSources(category: CategoryState)
    case getNewsArticles(sourceID: String)
}

extension NewsEndpoint: IEndpoint {
    var path: String {
        switch self {
        case .getNewsSources(let category):
            return SC.baseURLNews + "sources?" + "category=\(category)&" + SC.apiKey
        case .getNewsArticles(let sourceID):
            return SC.baseURLNews + "top-headlines?" + "sources=\(sourceID)&" + SC.apiKey
        }
    }

    var parameter: Parameters? {
        return [:]
    }

    var header: HTTPHeaders? {
        return nil
    }

    var encoding: ParameterEncoding {
        return URLEncoding.default
    }

    var method: HTTPMethod {
        return .get
    }
}
