//
//  CategoriesViewController.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 05/02/24.
//

import UIKit

protocol ICategoriesViewController: AnyObject {}

class CategoriesViewController: UIViewController {
    var presenter: ICategoriesPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension CategoriesViewController: ICategoriesViewController {}
