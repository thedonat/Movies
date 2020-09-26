//
//  NetworkManager.swift
//  Movies
//
//  Created by Burak Donat on 26.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

struct NetworkManager {
    func performRequest<T: Decodable>(type: ListType, completion: @escaping (NetworkResponse<T, NetworkError>) -> Void) {
        let endpoint = setEndPoint(type: type)
        let url = K.BASE_URL + endpoint.rawValue + K.API_KEY
        
        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    completion(NetworkResponse.failure(.network))
                }
                if let safeData = data {
                    if let decodedData = try? JSONDecoder().decode(T.self, from: safeData) {
                        completion(NetworkResponse.success(decodedData))
                    }
                }
            }.resume()
        }
    }
}

private func setEndPoint(type: ListType) -> EndPoints {
    var endPoint: EndPoints
    
    switch type {
    case .PopularMovies:
        endPoint = .getPopular
    case .TopRateMovies:
        endPoint = .getTopRates
    case .NowPlayingMovies:
        endPoint = .getNowPlaying
    case .PopularShows:
        endPoint = .getPopularTv
    case .TopRatedShows:
        endPoint = .getTopRatesTv
    }
    return endPoint
}
