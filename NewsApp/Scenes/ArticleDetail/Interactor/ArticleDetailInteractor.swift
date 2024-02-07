//
//  ArticleDetailInteractor.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 07/02/24.
//

import Foundation

protocol IArticleDetailInteractor: AnyObject {}

class ArticleDetailInteractor: IArticleDetailInteractor {
    private let apiService: IAPIService
    var presenter: IArticleDetailPresenter

    init(presenter: IArticleDetailPresenter, apiService: IAPIService) {
        self.presenter = presenter
        self.apiService = apiService
    }
}
