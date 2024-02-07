//
//  NewsSourceViewController.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 07/02/24.
//

import UIKit

protocol INewsSourceViewController: AnyObject {}

class NewsSourceViewController: UIViewController {
    var presenter: INewsSourcePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension NewsSourceViewController: INewsSourceViewController {}
