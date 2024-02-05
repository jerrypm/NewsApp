//
//  Extension+UITableView.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 05/02/24.
//

import UIKit

extension UITableView {
    func registerNib<T: UITableViewCell>(_ cell: T.Type) {
        let identifier = "\(cell)"
        register(UINib(nibName: String(describing: cell), bundle: nil), forCellReuseIdentifier: identifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(_ cell: T.Type, for indexPath: IndexPath) -> T {
        let identifier = "\(cell)"
        guard let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Error dequeueing cell")
        }
        return cell
    }
}

