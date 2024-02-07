//
//  CategoriesRouter.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 07/02/24.
//

import Foundation

protocol ICategoriesRouter: AnyObject {}

class CategoriesRouter: ICategoriesRouter {
    weak var viewController: CategoriesViewController?

    init(viewController: CategoriesViewController) {
        self.viewController = viewController
    }
}
