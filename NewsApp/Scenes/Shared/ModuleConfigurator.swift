//
//  ModuleConfigurator.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 05/02/24.
//

import Foundation

enum ModuleConfigurator {
    // MARK: Categories

    static func CategoriesConfigureModule() -> CategoriesViewController {
        let controller = CategoriesViewController()
        let router = CategoriesRouter(viewController: controller)
        let presenter = CategoriesPresenter()
        let apiService = APIService()

        let interactor = CategoriesInteractor(
            presenter: presenter,
            apiService: apiService
        )

        presenter.view = controller
        presenter.interactor = interactor
        presenter.router = router

        controller.presenter = presenter
        interactor.presenter = presenter
        router.viewController = controller

        return controller
    }

    // MARK: News Sources

    static func NewsSourceConfigureModule(parameters: [String: Any]) -> NewsSourceViewController {
        let controller = NewsSourceViewController()
        let router = NewsSourceRouter(viewController: controller)
        let presenter = NewsSourcePresenter(parameters: parameters)
        let apiService = APIService()

        let interactor = NewsSourceInteractor(
            presenter: presenter,
            apiService: apiService
        )

        presenter.view = controller
        presenter.interactor = interactor
        presenter.router = router

        controller.presenter = presenter
        interactor.presenter = presenter
        router.viewController = controller

        return controller
    }

    // MARK: News Articles

    static func NewsArticlesConfigureModule(parameters: [String: Any]) -> NewsArticlesViewController {
        let controller = NewsArticlesViewController()
        let router = NewsArticlesRouter(viewController: controller)
        let presenter = NewsArticlesPresenter(parameters: parameters)
        let apiService = APIService()

        let interactor = NewsArticlesInteractor(
            presenter: presenter,
            apiService: apiService
        )

        presenter.view = controller
        presenter.interactor = interactor
        presenter.router = router

        controller.presenter = presenter
        interactor.presenter = presenter
        router.viewController = controller
        return controller
    }

    // MARK: Article Detail

    static func ArticleDetailConfigureModule(parameters: [String: Any]) -> ArticleDetailViewController {
        let controller = ArticleDetailViewController()
        let router = ArticleDetailRouter(viewController: controller)
        let presenter = ArticleDetailPresenter(parameters: parameters)
        let apiService = APIService()

        let interactor = ArticleDetailInteractor(
            presenter: presenter,
            apiService: apiService
        )

        presenter.view = controller
        presenter.interactor = interactor
        presenter.router = router

        controller.presenter = presenter
        interactor.presenter = presenter
        router.viewController = controller
        return controller
    }
}
