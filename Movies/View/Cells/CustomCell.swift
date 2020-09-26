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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customCellView.layer.cornerRadius = 10
    }

    func setView(name: String, rating: Double?, date: String?, posterPath: String?) {
        nameLabel.text = name
        if let rating = rating, let date = date, let posterPath = posterPath {
            ratingLabel.text = String(rating)
            releaseDateLabel.text = String(date)
            let url = URL(string:  K.IMAGE_URL + posterPath)
            posterImageView.kf.setImage(with: url)
        }
    }
}
