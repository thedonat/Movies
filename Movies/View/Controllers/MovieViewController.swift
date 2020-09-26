//
//  MovieViewController.swift
//  Movies
//
//  Created by Burak Donat on 26.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var movieTableView: UITableView!
    private let movieViewModel: MovieViewModel = MovieViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }

    @IBAction func indexDidChange(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            movieViewModel.getMovies(type: .PopularMovies)
        case 1:
            movieViewModel.getMovies(type: .NowPlayingMovies)
        case 2:
            movieViewModel.getMovies(type: .PopularMovies)
        default:
            break;
        }
    }
    
    private func getData() {
        movieViewModel.delegate = self
        movieViewModel.getMovies(type: .PopularMovies)
    }
}


extension MovieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieViewModel.numberOfRow()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieTableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! CustomCell
        cell.textLabel?.text = movieViewModel.cellForRow(at: indexPath.row).title
        return cell
    }
}

extension MovieViewController: MovieViewModelProtocol {
    func didGetData() {
        DispatchQueue.main.async {
            self.movieTableView.reloadData()
        }
    }
}
