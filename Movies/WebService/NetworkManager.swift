//
//  NetworkManager.swift
//  Movies
//
//  Created by Burak Donat on 26.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

struct NetworkManager {
    
    func getMedia<T: Decodable>(type: ListType, completion: @escaping (NetworkResponse<T, NetworkError>) -> Void) {
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
                    } else {
                        completion(NetworkResponse.failure(.decoding))
                    }
                }
            }.resume()
        }
    }
    
    func getDetails<T: Decodable>(mediaID: Int, type: ListType, completion: @escaping (NetworkResponse<T, NetworkError>) -> Void) {
        let endpoint = setEndPoint(type: type)
        let creditEndpoint = getCreditEndpoint(type: type)
        let url = K.BASE_URL + endpoint.rawValue + "\(mediaID)" + creditEndpoint + K.API_KEY

        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    completion(NetworkResponse.failure(.network))
                }
                if let safeData = data {
                    if let decodedData = try? JSONDecoder().decode(T.self, from: safeData) {
                        completion(NetworkResponse.success(decodedData))
                    } else {
                        completion(NetworkResponse.failure(.decoding))
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
    case .MovieDetails:
        endPoint = .getMovieDetails
    case .TvDetails:
        endPoint = .getTvDetails
    case .MovieCast:
        endPoint = .getMovieDetails
    case .TvCast:
        endPoint = .getTvDetails
    }
    return endPoint
}

private func getCreditEndpoint(type: ListType) -> String {
    switch type {
    case .PopularMovies,
         .TopRateMovies,
         .NowPlayingMovies,
         .PopularShows,
         .TopRatedShows,
         .MovieDetails,
         .TvDetails:
            return "?"
    case .MovieCast,
         .TvCast:
            return "/credits?"
    }
}
