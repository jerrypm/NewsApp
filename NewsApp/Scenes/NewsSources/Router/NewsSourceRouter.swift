//
//  NewsSourceRouter.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 07/02/24.
//

import Foundation

protocol INewsSourceRouter: AnyObject {
    func navigateToArticles(source: String)
}

class NewsSourceRouter: INewsSourceRouter {
    weak var viewController: NewsSourceViewController?

    init(viewController: NewsSourceViewController) {
        self.viewController = viewController
    }
    
    func navigateToArticles(source: String) {
        let module = ModuleConfigurator.NewsArticlesConfigureModule(parameters: [SC.paramSource: source])
        viewController?.navigationController?.pushViewController(module, animated: true)
    }
}
