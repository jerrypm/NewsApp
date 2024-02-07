//
//  ArticleDetailViewController.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 07/02/24.
//

import UIKit
import WebKit

protocol IArticleDetailViewController: AnyObject {
    func loadURL(_ url: URL)
}

class ArticleDetailViewController: DefaultController {
    @IBOutlet weak var webView: WKWebView!
    var presenter: IArticleDetailPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = presenter?.title
        presenter?.viewDidLoad()
    }
}

extension ArticleDetailViewController: IArticleDetailViewController {
    func loadURL(_ url: URL) {
        let request = URLRequest(url: url)
        DispatchQueue.main.async {
            self.webView.load(request)
        }
    }
}
