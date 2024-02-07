//
//  NewsArticlesInteractor.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 07/02/24.
//

import Foundation

protocol INewsArticlesInteractor: AnyObject {
    func fetchNewsArticle(sourceID: String)
}

class NewsArticlesInteractor: INewsArticlesInteractor {
    private let apiService: IAPIService
    var presenter: INewsArticlesPresenter

    init(presenter: INewsArticlesPresenter, apiService: IAPIService) {
        self.presenter = presenter
        self.apiService = apiService
    }

    func fetchNewsArticle(sourceID: String) {
        apiService.getNewsArticle(sourceID: sourceID) { response in
            switch response {
            case .success(let value):
                let model = NewsArticlesModel(json: value)
                if model.articles?.isEmpty == true {
                    self.presenter.presentArticleFailed(message: model.message ?? .empty)
                } else {
                    self.presenter.presentArticleSuccess(articles: model.articles)
                }
            case .failure(let error):
                self.presenter.presentArticleFailed(message: error.localizedDescription)
            }
        }
    }
}
