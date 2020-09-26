//
//  DetailsViewModel.swift
//  Movies
//
//  Created by Burak Donat on 26.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

protocol DetailsViewModelProtocol: class {
    func didGetDetails()
}

class MovieDetailsViewModel {
    weak var delegate: DetailsViewModelProtocol?
    public var detailID: Int = Int()
    private var manager: NetworkManager = NetworkManager()
    private var details: MovieDetails? = nil
    
    func getDetails(type: ListType){
        manager.getDetails(mediaID: detailID, type: type) { [weak self] (response: NetworkResponse<MovieDetails, NetworkError>) in
            guard let self = self else { return }
            
            switch response {
            case .success(let result):
                self.details = result
                self.delegate?.didGetDetails()
                print(self.details)
                break
            case .failure(let error):
                print(error.errorMessage)
            }
        }
    }
    
    func getCast() {
        
    }
}
