//
//  CastCell.swift
//  Movies
//
//  Created by Burak Donat on 27.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit

class CastCell: UITableViewCell, UICollectionViewDelegate {

    @IBOutlet weak var castCollectionView: UICollectionView!
    public var categoryType: CategoryType? = nil
    var array: [Cast] = [] {
        didSet {
            castCollectionView.reloadData()
        }
    }
    
    var array2: [ShowCast] = [] {
        didSet {
              castCollectionView.reloadData()
          }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        castCollectionView.dataSource = self
        castCollectionView.delegate = self
        castCollectionView.register(UINib(nibName: "CastCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CastCollection")
        let width = (self.frame.width-20)/3
        let height = (self.frame.width-20)/2
        let layout = castCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: height)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
//    {
//        return CGSize(width: 100.0, height: 120.0)
//    }
}

extension CastCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if categoryType == .Movies {
            return array.count
        } else {
            return array2.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = castCollectionView.dequeueReusableCell(withReuseIdentifier: "CastCollection", for: indexPath) as! CastCollectionViewCell
        if categoryType == .Movies {
            let vm = array[indexPath.row]
            cell.setView(image: vm.profile_path, character: vm.character, name: vm.name)
        } else {
            let vm = array2[indexPath.row]
            cell.setView(image: vm.profile_path, character: vm.character, name: vm.name)
        }
        return cell
    }
}
