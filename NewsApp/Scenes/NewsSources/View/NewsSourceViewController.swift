//
//  NewsSourceViewController.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 07/02/24.
//

import UIKit

protocol INewsSourceViewController: AnyObject {
    func displaySourcesSuccess(sources: [Sources]?)
    func displaySourcesFailed(message: String)
}

class NewsSourceViewController: DefaultController {
    @IBOutlet weak var tableView: UITableView!
    var presenter: INewsSourcePresenter?
    var sourcesData: [Sources]?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = presenter?.title
        presenter?.viewDidLoad()
        setupTable()
    }

    private func setupTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerNib(NewSourceTableViewCell.self)
        tableView.rowHeight = UITableView.automaticDimension
    }
}

extension NewsSourceViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sourcesData?.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(NewSourceTableViewCell.self, for: indexPath)
        cell.setSources(data: sourcesData?[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.router?.navigateToArticles(source: sourcesData?[indexPath.row].id ?? .empty)
    }
}

extension NewsSourceViewController: INewsSourceViewController {
    func displaySourcesSuccess(sources: [Sources]?) {
        sourcesData = sources
        tableView.reloadData()
    }
    
    func displaySourcesFailed(message: String) {
        AlertManager.shared.showAlertMessage(title: SC.failedText, message: message, viewController: self)
    }
}
