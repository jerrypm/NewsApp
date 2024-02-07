//
//  NewsSourceInteractor.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 07/02/24.
//

import Foundation

protocol INewsSourceInteractor: AnyObject {}


class NewsSourceInteractor: INewsSourceInteractor {
    private let apiService: IAPIService
    var presenter: INewsSourcePresenter

    init(presenter: INewsSourcePresenter, apiService: IAPIService) {
        self.presenter = presenter
        self.apiService = apiService
    }
}
