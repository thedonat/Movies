//
//  DetailsViewController.swift
//  Movies
//
//  Created by Burak Donat on 26.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var movieDetailsTableView: UITableView!
    let detailsViewModel: DetailsViewModel = DetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsViewModel.delegate = self
        switchType()
        movieDetailsTableView.register(UINib(nibName: "DetailCell", bundle: nil), forCellReuseIdentifier: "MoiveCell")
        movieDetailsTableView.register(UINib(nibName: "CastCell", bundle: nil), forCellReuseIdentifier: "CastCell")
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func switchType () {
        if detailsViewModel.categoryType == .Movies {
            detailsViewModel.getCast(type: .MovieCast)
            detailsViewModel.getDetails(type: .MovieDetails)
        } else {
            detailsViewModel.getShowCast(type: .TvCast)
            detailsViewModel.getShowDetails(type: .TvDetails)
        }
    }
}

extension DetailsViewController: DetailsViewModelProtocol {
    func didGetDetails() {
        DispatchQueue.main.async {
            self.movieDetailsTableView.reloadData()
        }
    }
}

extension DetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = movieDetailsTableView.dequeueReusableCell(withIdentifier: "MoiveCell", for: indexPath) as! DetailCell
            if detailsViewModel.categoryType == .Movies {
                let movieDetail = detailsViewModel.cellForRow()
                cell.setView(name: movieDetail?.name,
                             posterPath: movieDetail?.posterPath,
                             description: movieDetail?.overview,
                             rating: movieDetail?.voteAverage,
                             popularity: movieDetail?.popularity,
                             runtime: movieDetail?.runtime)
            } else {
                let showDetail = detailsViewModel.getTvDetails()
                cell.setView(name: showDetail?.name,
                             posterPath: showDetail?.posterPath,
                             description: showDetail?.overview,
                             rating: showDetail?.voteAverage,
                             popularity: showDetail?.popularity,
                             runtime: showDetail?.runtime?[0])
            }
            return cell
        } else {
            let cell = movieDetailsTableView.dequeueReusableCell(withIdentifier: "CastCell", for: indexPath) as! CastCell
            if detailsViewModel.categoryType == .Movies {
                let movieCast = detailsViewModel.getMovieCast()
                cell.categoryType = .Movies
                cell.array = movieCast
            } else {
                let showCast = detailsViewModel.getTvCast()
                cell.categoryType = .TvShows
                cell.array2 = showCast
            }
            return cell
        }
    }
}
