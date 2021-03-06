//
//  MovieViewController.swift
//  Movies
//
//  Created by Burak Donat on 26.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var movieTableView: UITableView!
    private let movieViewModel: MovieViewModel = MovieViewModel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
        getData()
    }

    // MARK: - Helpers
    @IBAction func indexDidChange(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            movieViewModel.getMovies(type: .PopularMovies)
        case 1:
            movieViewModel.getMovies(type: .NowPlayingMovies)
        case 2:
            movieViewModel.getMovies(type: .TopRateMovies)
        default:
            break;
        }
    }
    
    private func prepareUI() {
        movieTableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
    }
    
    private func getData() {
        movieViewModel.delegate = self
        movieViewModel.getMovies(type: .PopularMovies)
    }
}

// MARK: - UITableViewDataSource
extension MovieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieViewModel.numberOfRow()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieTableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! CustomCell
        let vm = movieViewModel.cellForRow(at: indexPath.row)
        cell.setView(name: vm.title,
                     rating: vm.vote_average,
                     date: vm.release_date,
                     posterPath: vm.poster_path,
                     popularity: vm.popularity)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MovieViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(identifier: "MovieDetails") as! DetailsViewController
        let vm = movieViewModel.cellForRow(at: indexPath.row)
        destinationVC.detailsViewModel.detailID = vm.id
        destinationVC.detailsViewModel.categoryType = .Movies
        navigationController?.pushViewController(destinationVC, animated: true)
    }
}

extension MovieViewController: MovieViewModelProtocol {
    func didGetMovieData() {
        DispatchQueue.main.async {
            self.movieTableView.reloadData()
        }
    }
}
