//
//  CategoriesRouter.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 07/02/24.
//

import Foundation

protocol ICategoriesRouter: AnyObject {
    func navigateToSources(category: CategoryState)
}

class CategoriesRouter: ICategoriesRouter {
    weak var viewController: CategoriesViewController?

    init(viewController: CategoriesViewController) {
        self.viewController = viewController
    }
    
    func navigateToSources(category: CategoryState) {
        let module = ModuleConfigurator.NewsSourceConfigureModule(parameters: [SC.paramCategory: category])
        viewController?.navigationController?.pushViewController(module, animated: true)
    }
}
