//
//  NewsArticlesRouter.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 07/02/24.
//

import Foundation

protocol INewsArticlesRouter: AnyObject {
    func navigateToWeb(articles: Articles?)
}

class NewsArticlesRouter: INewsArticlesRouter {
    weak var viewController: NewsArticlesViewController?

    init(viewController: NewsArticlesViewController) {
        self.viewController = viewController
    }
    
    func navigateToWeb(articles: Articles?) {
        if let article = articles {
            let module = ModuleConfigurator.ArticleDetailConfigureModule(parameters: [SC.paramURL: article])
            viewController?.navigationController?.pushViewController(module, animated: true)
        }
    }
}
