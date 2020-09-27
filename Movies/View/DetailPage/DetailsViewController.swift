//
//  DetailsViewController.swift
//  Movies
//
//  Created by Burak Donat on 26.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var detailsTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    let detailsViewModel: DetailViewModel = DetailViewModel()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        switchTypeToLoad()
        prepareUI()

    }
    
    // MARK: - Helpers
    private func prepareUI() {
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.barTintColor = .black
        detailsTableView.register(UINib(nibName: "DetailCell", bundle: nil), forCellReuseIdentifier: "MoiveCell")
        detailsTableView.register(UINib(nibName: "CastCell", bundle: nil), forCellReuseIdentifier: "CastCell")
        activityIndicator.startAnimating()
    }
    
    private func configureUI() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        detailsTableView.isHidden = false
    }
    
    private func switchTypeToLoad () {
        detailsViewModel.delegate = self
        
        if detailsViewModel.categoryType == .Movies {
            detailsViewModel.getMovieCast(type: .MovieCast)
            detailsViewModel.getMovieDetails(type: .MovieDetails)
        } else {
            detailsViewModel.getShowCast(type: .TvCast)
            detailsViewModel.getShowDetails(type: .TvDetails)
        }
    }
}

// MARK: - DetailViewModelProtocol
extension DetailsViewController: DetailViewModelProtocol {
    func didGetDetails() {
        DispatchQueue.main.async {
            self.detailsTableView.reloadData()
            self.configureUI()
        }
    }
}

// MARK: - UITableViewDataSource
extension DetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = detailsTableView.dequeueReusableCell(withIdentifier: "MoiveCell", for: indexPath) as! DetailCell
            if detailsViewModel.categoryType == .Movies {
                let movieDetail = detailsViewModel.getMovieDetails()
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
                             runtime: showDetail?.runtime?.first)
            }
            return cell
            
        } else {
            let cell = detailsTableView.dequeueReusableCell(withIdentifier: "CastCell", for: indexPath) as! CastCell
            if detailsViewModel.categoryType == .Movies {
                let movieCast = detailsViewModel.getMovieCast()
                cell.categoryType = .Movies
                cell.movieCast = movieCast
            } else {
                let showCast = detailsViewModel.getTvCast()
                cell.categoryType = .TvShows
                cell.showCast = showCast
            }
            return cell
        }
    }
}
