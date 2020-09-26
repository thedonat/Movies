//
//  TvShow.swift
//  Movies
//
//  Created by Burak Donat on 26.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

struct TvShow: Codable {
    let results: [TvShowResult]
}

// MARK: - Result
struct TvShowResult: Codable {
    let name: String
    let voteCount: Int?
    let firstAirDate : String?
    let id: Int
    let voteAverage: Double?
    let posterPath: String?
}
