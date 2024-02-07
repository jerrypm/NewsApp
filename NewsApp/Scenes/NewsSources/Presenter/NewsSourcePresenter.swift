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

    func viewDidLoad()
}

class NewsSourcePresenter: INewsSourcePresenter {
    var router: INewsSourceRouter?
    var interactor: INewsSourceInteractor?
    var view: INewsSourceViewController?

    func viewDidLoad() {
        #warning("here")
    }
}
