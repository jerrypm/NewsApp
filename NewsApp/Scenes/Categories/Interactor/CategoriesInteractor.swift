//
//  CategoriesInteractor.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 05/02/24.
//

import Foundation

protocol ICategoriesInteractor: AnyObject {}

class CategoriesInteractor: ICategoriesInteractor {
    private let apiService: IAPIService
    var presenter: ICategoriesPresenter

    init(presenter: ICategoriesPresenter, apiService: IAPIService) {
        self.presenter = presenter
        self.apiService = apiService
    }
}
