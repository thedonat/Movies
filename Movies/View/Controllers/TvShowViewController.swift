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
    let tvShowViewModel: TvShowViewModel = TvShowViewModel()
    
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
        cell.textLabel?.text = tvShowViewModel.cellForRow(at: indexPath.row).name
        return cell
    }
}

extension TvShowViewController: TvShowViewModelProtocol {
    func didGetData() {
        DispatchQueue.main.async {
            self.tvShowTableView.reloadData()
        }
    }
}
