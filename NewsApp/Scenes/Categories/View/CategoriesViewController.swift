//
//  CategoriesViewController.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 05/02/24.
//

import UIKit

protocol ICategoriesViewController: AnyObject {}

class CategoriesViewController: DefaultController {
    @IBOutlet weak var tableView: UITableView!
    var presenter: ICategoriesPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = SC.titleNews
        presenter?.viewDidLoad()
        setupTable()
    }

    private func setupTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerNib(CategoriesTableViewCell.self)
        tableView.rowHeight = UITableView.automaticDimension
    }
}

extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CategoryState.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(CategoriesTableViewCell.self, for: indexPath)
        let category = CategoryState.allCases[indexPath.row]
        cell.textCategoryLabel.text = category.value.capitalized

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCategory = CategoryState.allCases[indexPath.row]
        presenter?.navigateToSources(category: selectedCategory)
    }
}

extension CategoriesViewController: ICategoriesViewController {}
