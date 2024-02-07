//
//  NewsArticlesViewController.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 07/02/24.
//

import UIKit
protocol INewsArticlesViewController: AnyObject {
    func displayArticleSuccess(articles: [Articles]?)
    func displayArticlesFailed(message: String)
}

class NewsArticlesViewController: DefaultController {
    @IBOutlet weak var tableView: UITableView!
    var presenter: INewsArticlesPresenter?
    var articles: [Articles]?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = presenter?.title
        presenter?.viewDidLoad()
        setupTable()
    }

    private func setupTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerNib(NewsArticleTableViewCell.self)
        tableView.rowHeight = 120
    }
}

extension NewsArticlesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles?.count ?? .zero
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(NewsArticleTableViewCell.self, for: indexPath)
        cell.setArticle(data: articles?[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.router?.navigateToWeb(articles: articles?[indexPath.row])
    }
}

extension NewsArticlesViewController: INewsArticlesViewController {
    func displayArticleSuccess(articles: [Articles]?) {
        self.articles = articles
        tableView.reloadData()
    }

    func displayArticlesFailed(message: String) {
        AlertManager.shared.showAlertMessage(title: SC.failedText, message: message, viewController: self)
    }
}
