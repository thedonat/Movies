//
//  TvShowViewModel.swift
//  Movies
//
//  Created by Burak Donat on 26.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

protocol TvShowViewModelProtocol: class {
    func didGetData()
}

class TvShowViewModel {
    weak var delegate: TvShowViewModelProtocol?
    private var shows: [TvShowResult] = []
    private var manager: NetworkManager = NetworkManager()
    
    func numberOfRow() -> Int {
        return shows.count
    }
    
    func cellForRow(at index: Int) -> TvShowResult {
        return shows[index]
    }
    
    func getShows(type: ListType){
        manager.getMedia(type: type) { [weak self] (response: NetworkResponse<TvShow, NetworkError>) in
            guard let self = self else { return }
            
            switch response {
            case .success(let result):
                self.shows = result.results
                self.delegate?.didGetData()
                break
            case .failure(let error):
                print(error.errorMessage)
            }
        }
    }
}
