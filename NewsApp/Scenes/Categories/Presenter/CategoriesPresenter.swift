//
//  CategoriesPresenter.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 05/02/24.
//

import Foundation

protocol ICategoriesPresenter: AnyObject {
    var router: ICategoriesRouter? { get set }
    var interactor: ICategoriesInteractor? { get set }
    var view: ICategoriesViewController? { get set }

    func viewDidLoad()
}

class CategoriesPresenter: ICategoriesPresenter {
    weak var view: ICategoriesViewController?
    var router: ICategoriesRouter?
    var interactor: ICategoriesInteractor?

    func viewDidLoad() {
        #warning("here")
    }
}
