//
//  ArticleDetailRouter.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 07/02/24.
//

import Foundation

protocol IArticleDetailRouter: AnyObject {}

class ArticleDetailRouter: IArticleDetailRouter {
    weak var viewController: ArticleDetailViewController?

    init(viewController: ArticleDetailViewController) {
        self.viewController = viewController
    }
}
