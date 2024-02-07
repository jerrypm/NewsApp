//
//  APIService.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 05/02/24.
//

import Alamofire
import Foundation
import SwiftyJSON

typealias CompletionHandlerSwifty = (Swift.Result<JSON, Error>) -> Void

protocol IAPIService {
    func getNewsSource(category: CategoryState, completion: @escaping CompletionHandlerSwifty)
    func getNewsArticle(sourceID: String, completion: @escaping CompletionHandlerSwifty)
}

class APIService: IAPIService {
    func getNewsSource(category: CategoryState, completion: @escaping CompletionHandlerSwifty) {
        request(endpoint: NewsEndpoint.getNewsSources(category: category), completion: completion)
    }

    func getNewsArticle(sourceID: String, completion: @escaping CompletionHandlerSwifty) {
        request(endpoint: NewsEndpoint.getNewsArticles(sourceID: sourceID), completion: completion)
    }

    private func request<T: IEndpoint>(endpoint: T, completion: @escaping CompletionHandlerSwifty) {
        print("Request URL: \(endpoint.path)")

        AF.request(
            endpoint.path,
            method: endpoint.method,
            parameters: endpoint.parameter,
            encoding: endpoint.encoding,
            headers: endpoint.header

        ).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let json = try JSON(data: data)
                    completion(.success(json))
                } catch {
                    print("Error decoding JSON: \(error)")
                    completion(.failure(error))
                }
            case .failure(let error):
                print("Error fetching data: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
}
