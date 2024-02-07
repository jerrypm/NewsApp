//
//  NewSourceTableViewCell.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 07/02/24.
//

import UIKit

class NewSourceTableViewCell: UITableViewCell {
    @IBOutlet weak var titleSource: UILabel!
    @IBOutlet weak var descSource: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setSources(data: Sources?) {
        titleSource.text = data?.name
        descSource.text = data?.descriptionValue
    }
}
