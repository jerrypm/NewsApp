//
//  NewsSourceInteractor.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 07/02/24.
//

import Foundation

protocol INewsSourceInteractor: AnyObject {
    func fetchNewsSources(category: CategoryState)
}


class NewsSourceInteractor: INewsSourceInteractor {
    private let apiService: IAPIService
    var presenter: INewsSourcePresenter

    init(presenter: INewsSourcePresenter, apiService: IAPIService) {
        self.presenter = presenter
        self.apiService = apiService
    }
    
    func fetchNewsSources(category: CategoryState) {
        apiService.getNewsSource(category: category) { response in
            switch response {
            case .success(let value):
                let model = NewsSourcesModel(json: value)
                if model.sources?.isEmpty == true {
                    self.presenter.presentNewsSourcesfailed(message: model.message ?? .empty)
                } else {
                    self.presenter.presentNewsSourcesSuccess(sources: model.sources)
                }
            case .failure(let error):
                self.presenter.presentNewsSourcesfailed(message: error.localizedDescription)
            }
        }
    }
}
