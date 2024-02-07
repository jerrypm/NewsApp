//
//  ArticleDetailPresenter.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 07/02/24.
//

import Foundation

protocol IArticleDetailPresenter: AnyObject {
    var router: IArticleDetailRouter? { get set }
    var interactor: IArticleDetailInteractor? { get set }
    var view: IArticleDetailViewController? { get set }
    var title: String? { get set }

    func viewDidLoad()
}

class ArticleDetailPresenter: IArticleDetailPresenter {
    var router: IArticleDetailRouter?
    var interactor: IArticleDetailInteractor?
    var view: IArticleDetailViewController?
    var title: String?
    var webURLString: String?

    init(parameters: [String: Any]) {
        let param = parameters[SC.paramURL] as? Articles
        webURLString = param?.url
        title = param?.source?.name
    }

    func viewDidLoad() {
        if let url = URL(string: self.webURLString ?? .empty) {
            self.view?.loadURL(url)
        }
    }
}
