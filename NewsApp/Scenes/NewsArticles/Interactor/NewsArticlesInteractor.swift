//
//  NewsArticlesInteractor.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 07/02/24.
//

import Foundation

protocol INewsArticlesInteractor: AnyObject {}

class NewsArticlesInteractor: INewsArticlesInteractor {
    private let apiService: IAPIService
    var presenter: INewsArticlesPresenter

    init(presenter: INewsArticlesPresenter, apiService: IAPIService) {
        self.presenter = presenter
        self.apiService = apiService
    }
}
