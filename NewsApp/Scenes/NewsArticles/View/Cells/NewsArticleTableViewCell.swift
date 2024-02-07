//
//  NewsArticleTableViewCell.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 07/02/24.
//

import SDWebImage
import UIKit

class NewsArticleTableViewCell: UITableViewCell {
    @IBOutlet weak var imageNews: UIImageView!
    @IBOutlet weak var titleNews: UILabel!
    @IBOutlet weak var descNews: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setArticle(data: Articles?) {
        titleNews.text = data?.title
        descNews.text = data?.descriptionValue

        guard let imageURL = URL(string: data?.urlToImage ?? .empty) else {
            return
        }
        imageNews.sd_setImage(with: imageURL, placeholderImage: UIImage(named: SC.emptyImage.value))
    }
}
