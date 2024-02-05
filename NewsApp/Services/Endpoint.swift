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

enum AnimalEndpoint {
}

extension AnimalEndpoint: IEndpoint {
    var path: String {
        return .empty
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

