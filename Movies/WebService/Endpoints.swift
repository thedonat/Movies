//
//  Endpoints.swift
//  Movies
//
//  Created by Burak Donat on 26.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

enum EndPoints: String {
    case getPopular  = "/movie/popular?"
    case getTopRates = "/movie/top_rated?"
    case getNowPlaying  = "/movie/now_playing?"
    case getGenres = "/genre/movie/list?"
    case getPopularTv  = "/tv/popular?"
    case getTopRatesTv = "/tv/top_rated?"
    case getMovieDetails = "/movie/"
    case getTvDetails = "/tv/"
}
