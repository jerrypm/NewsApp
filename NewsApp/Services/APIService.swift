//
//  APIService.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 05/02/24.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias CompletionHandlerSwifty = (Swift.Result<JSON, Error>) -> Void

protocol IAPIService {
}

class APIService: IAPIService {
    

    private func request<T: IEndpoint>(endpoint: T, completion: @escaping CompletionHandlerSwifty) {
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
