//
//  NewsArticlesViewController.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 07/02/24.
//

import UIKit
protocol INewsArticlesViewController: AnyObject {}

class NewsArticlesViewController: UIViewController {
    var presenter: INewsArticlesPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
    }
}

extension NewsArticlesViewController: INewsArticlesViewController {}
