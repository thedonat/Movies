//
//  BaseViewModel.swift
//  Movies
//
//  Created by Burak Donat on 26.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

enum ListType: String{
    case PopularMovies
    case TopRateMovies = "Top Rate"
    case NowPlayingMovies
    case PopularShows
    case TopRatedShows
}


enum CategoryType{
    case Movies
    case TvShows
}
