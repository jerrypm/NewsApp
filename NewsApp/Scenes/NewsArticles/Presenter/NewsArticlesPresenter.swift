//
//  NewsArticlesPresenter.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 07/02/24.
//

import Foundation

protocol INewsArticlesPresenter: AnyObject {
    var router: INewsArticlesRouter? { get set }
    var interactor: INewsArticlesInteractor? { get set }
    var view: INewsArticlesViewController? { get set }
    var title: String? { get set }

    func viewDidLoad()
    func presentArticleSuccess(articles: [Articles]?)
    func presentArticleFailed(message: String)
}

class NewsArticlesPresenter: INewsArticlesPresenter {
    var router: INewsArticlesRouter?
    var interactor: INewsArticlesInteractor?
    var view: INewsArticlesViewController?
    var title: String?
    var source: String?

    init(parameters: [String: Any]) {
        source = parameters[SC.paramSource] as? String
        title = source?.capitalized
    }

    func viewDidLoad() {
        guard let sourceID = source else { return }
        interactor?.fetchNewsArticle(sourceID: sourceID)
    }

    func presentArticleSuccess(articles: [Articles]?) {
        view?.displayArticleSuccess(articles: articles)
    }

    func presentArticleFailed(message: String) {
        view?.displayArticlesFailed(message: message)
    }
}
