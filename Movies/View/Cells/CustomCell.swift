//
//  CustomTableViewCell.swift
//  Movies
//
//  Created by Burak Donat on 26.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit
import Kingfisher


class CustomCell: UITableViewCell {

    @IBOutlet weak var customCellView: UIView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customCellView.layer.cornerRadius = 10
    }

    func setView(name: String, rating: Double?, date: String?, posterPath: String?, popularity: Double?) {
        nameLabel.text = name
        ImageLoader().loadImage(with: posterPath, image: posterImageView)
        if let rating = rating, let date = date, let popularity = popularity {
            ratingLabel.text = String(rating)
            releaseDateLabel.text = String(date)
            popularityLabel.text = String(popularity)
        }
    }
}
