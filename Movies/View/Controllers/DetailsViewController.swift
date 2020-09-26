//
//  DetailsViewController.swift
//  Movies
//
//  Created by Burak Donat on 26.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    let detailsViewModel: MovieDetailsViewModel = MovieDetailsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsViewModel.delegate = self
    }
}

extension MovieDetailsViewController: DetailsViewModelProtocol {
    func didGetDetails() {
    }
}
