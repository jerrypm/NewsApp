//
//  ArticleDetailViewController.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 07/02/24.
//

import UIKit

protocol IArticleDetailViewController: AnyObject {}

class ArticleDetailViewController: UIViewController {
    var presenter: IArticleDetailPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
    }
}

extension ArticleDetailViewController: IArticleDetailViewController {}
