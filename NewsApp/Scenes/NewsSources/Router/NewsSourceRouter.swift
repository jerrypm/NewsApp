//
//  NewsSourceRouter.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 07/02/24.
//

import Foundation

protocol INewsSourceRouter: AnyObject {}

class NewsSourceRouter: INewsSourceRouter {
    weak var viewController: NewsSourceViewController?

    init(viewController: NewsSourceViewController) {
        self.viewController = viewController
    }
}
