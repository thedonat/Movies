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
    let vote_count: Int?
    let first_air_date : String?
    let id: Int
    let vote_average: Double?
    let poster_path: String?
}
