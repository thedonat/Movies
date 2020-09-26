//
//  TvShowDetailsViewController.swift
//  Movies
//
//  Created by Burak Donat on 26.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit

class TvShowDetailsViewController: UIViewController {

    let detailsViewModel: MovieDetailsViewModel = MovieDetailsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsViewModel.delegate = self
        detailsViewModel.getDetails(type: .TvDetails)
        detailsViewModel.getCast(type: .TvCast)
    }
}

extension TvShowDetailsViewController: MovieDetailsViewModelProtocol {
    func didGetDetails() {
    }
}
