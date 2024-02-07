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
    
    func viewDidLoad()
}

class ArticleDetailPresenter: IArticleDetailPresenter {
    var router: IArticleDetailRouter?
    var interactor: IArticleDetailInteractor?
    var view: IArticleDetailViewController?
    
    func viewDidLoad() {
        #warning("here")
    }
}
