//
//  MovieTableViewCell.swift
//  Movies
//
//  Created by Burak Donat on 26.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit
import Kingfisher

class DetailCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieRuntimeLabel: UILabel!
    @IBOutlet weak var moviePopularityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setView(name: String?, posterPath: String?, description: String?, rating: Double?, popularity: Double?, runtime: Int?) {
        movieNameLabel.text = name
        movieDescriptionLabel.text = description
        
        if let posterPath = posterPath, let rating = rating, let popularity = popularity, let runtime = runtime {
            let url = URL(string:  K.IMAGE_URL + posterPath)
            movieImageView.kf.setImage(with: url)
            moviePopularityLabel.text = String(popularity)
            movieRatingLabel.text = String(rating)
            movieRuntimeLabel.text = String(runtime) + " min"
        }
    }
}
