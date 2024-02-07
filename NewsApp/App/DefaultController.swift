//
//  ViewController.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 05/02/24.
//

import UIKit

class DefaultController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: .empty, style: .plain, target: nil, action: nil)
    }
}
