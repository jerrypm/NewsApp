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

    func viewDidLoad()
}

class NewsArticlesPresenter: INewsArticlesPresenter {
    var router: INewsArticlesRouter?
    var interactor: INewsArticlesInteractor?
    var view: INewsArticlesViewController?

    func viewDidLoad() {
        #warning("here")
    }
}
