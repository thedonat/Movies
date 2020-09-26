//
//  DetailsViewModel.swift
//  Movies
//
//  Created by Burak Donat on 26.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

protocol TvShowDetailsViewModelProtocol: class {
    func didGetDetails()
}

class TvShowDetailsViewModel {
    weak var delegate: TvShowDetailsViewModelProtocol?
    public var detailID: Int = Int()
    public var categoryType: CategoryType? = nil
    private var manager: NetworkManager = NetworkManager()
    private var details: TvShowDetails? = nil
    private var cast: [ShowCast] = []
    
    func getDetails(type: ListType){
        manager.getDetails(mediaID: detailID, type: type) { [weak self] (response: NetworkResponse<TvShowDetails, NetworkError>) in
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
    
    func getCast(type: ListType) {
        manager.getDetails(mediaID: detailID, type: type) { [weak self] (response: NetworkResponse<TvShowCast, NetworkError>) in
            guard let self = self else { return }
            
            switch response {
            case .success(let result):
                self.cast = result.cast
                self.delegate?.didGetDetails()
                print(self.cast)
                break
            case .failure(let error):
                print(error.errorMessage)
            }
        }
    }
}
