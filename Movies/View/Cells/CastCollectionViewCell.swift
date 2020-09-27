//
//  CastCollectionViewCell.swift
//  Movies
//
//  Created by Burak Donat on 27.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit
import Kingfisher

class CastCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var castImageView: UIImageView!
    @IBOutlet weak var castCharacterLabel: UILabel!
    @IBOutlet weak var castNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setView(imagePath: String?, character: String?, name: String?) {
        castCharacterLabel.text = character
        castNameLabel.text = name
        ImageLoader().loadImage(with: imagePath, image: castImageView)
    }
}
