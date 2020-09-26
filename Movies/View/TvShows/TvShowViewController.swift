//
//  TvShowViewController.swift
//  Movies
//
//  Created by Burak Donat on 26.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit

class TvShowViewController: UIViewController {

    @IBOutlet weak var tvShowTableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    private let tvShowViewModel: TvShowViewModel = TvShowViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    @IBAction func indexDidChange(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            tvShowViewModel.getShows(type: .PopularShows)
        case 1:
            tvShowViewModel.getShows(type: .TopRatedShows)
        default:
            break;
        }
    }
    
    private func getData() {
        tvShowTableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "TvCell")
        tvShowViewModel.delegate = self
        tvShowViewModel.getShows(type: .PopularShows)
    }
}

extension TvShowViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tvShowViewModel.numberOfRow()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tvShowTableView.dequeueReusableCell(withIdentifier: "TvCell", for: indexPath) as! CustomCell
        let vm = tvShowViewModel.cellForRow(at: indexPath.row)
        cell.setView(name: vm.name,
                     rating: vm.vote_average,
                     date: vm.first_air_date,
                     posterPath: vm.poster_path)
        return cell
    }
}

extension TvShowViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(identifier: "TvShowDetails") as! TvShowDetailsViewController
        let vm = tvShowViewModel.cellForRow(at: indexPath.row)
        destinationVC.detailsViewModel.detailID = vm.id
        destinationVC.detailsViewModel.categoryType = .TvShows
        navigationController?.pushViewController(destinationVC, animated: true)
    }
}

extension TvShowViewController: TvShowViewModelProtocol {
    func didGetData() {
        DispatchQueue.main.async {
            self.tvShowTableView.reloadData()
        }
    }
}
