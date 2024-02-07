//
//  NewsSourcePresenter.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 07/02/24.
//

import Foundation

protocol INewsSourcePresenter: AnyObject {
    var router: INewsSourceRouter? { get set }
    var interactor: INewsSourceInteractor? { get set }
    var view: INewsSourceViewController? { get set }
    var title: String? { get set }

    func viewDidLoad()
    func presentNewsSourcesSuccess(sources: [Sources]?)
    func presentNewsSourcesfailed(message: String)
}

class NewsSourcePresenter: INewsSourcePresenter {
    var router: INewsSourceRouter?
    var interactor: INewsSourceInteractor?
    var view: INewsSourceViewController?
    var title: String?
    var category: CategoryState?

    init(parameters: [String: Any]) {
        let categoryParam = parameters[SC.paramCategory] as? CategoryState
        title = categoryParam?.value.capitalized
        category = categoryParam
    }

    func viewDidLoad() {
        if let category = category {
            interactor?.fetchNewsSources(category: category)
        }
    }

    func presentNewsSourcesSuccess(sources: [Sources]?) {
        view?.displaySourcesSuccess(sources: sources)
    }

    func presentNewsSourcesfailed(message: String) {
        view?.displaySourcesFailed(message: message)
    }
}
