//
//  Endpoints.swift
//  Movies
//
//  Created by Burak Donat on 26.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

enum MoviesEndPoint: String {
    case getPopular  = "/movie/popular?"
    case getTopRates = "/movie/top_rated?"
    case getNowPlaying  = "/movie/now_playing?"
    case getGenres = "/genre/movie/list?"
}


enum TvShowsEndPoint: String {
    case getPopularTv  = "/tv/popular?"
    case getTopRatesTv = "/tv/top_rated?"
    case getUpcomingsTv = "/tv/airing_today?"
}
