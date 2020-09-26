//
//  MovieViewModel.swift
//  Movies
//
//  Created by Burak Donat on 26.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

protocol MovieViewModelProtocol: class {
    func didGetData()
}

class MovieViewModel {
    weak var delegate: MovieViewModelProtocol?
    private var movies: [MovieResult] = []
    private var manager: NetworkManager = NetworkManager()
    
    func numberOfRow() -> Int {
        return movies.count
    }
    
    func cellForRow(at index: Int) -> MovieResult {
        return movies[index]
    }
    
    func getMovies(type: ListType){
        manager.performRequest(type: type) { [weak self] (response: NetworkResponse<Movie, NetworkError>) in
            guard let self = self else { return }
            
            switch response {
            case .success(let result):
                self.movies = result.results
                self.delegate?.didGetData()
                print(self.movies)
                break
            case .failure(let error):
                print(error.errorMessage)
            }
        }
    }
}
