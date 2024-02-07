//
//  NewsArticlesRouter.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 07/02/24.
//

import Foundation

protocol INewsArticlesRouter: AnyObject {}

class NewsArticlesRouter: INewsArticlesRouter {
    weak var viewController: NewsArticlesViewController?

    init(viewController: NewsArticlesViewController) {
        self.viewController = viewController
    }
}
