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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func indexDidChange(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            print(0)
        case 1:
            print(1)
        default:
            break;
        }
    }
}

extension TvShowViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tvShowTableView.dequeueReusableCell(withIdentifier: "TvCell", for: indexPath) as! CustomCell
        return cell
    }
}
