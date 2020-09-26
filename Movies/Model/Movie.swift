//
//  Movie.swift
//  Movies
//
//  Created by Burak Donat on 26.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

// MARK: - Movie
struct Movie: Codable {
    let results: [MovieResult]
}

// MARK: - Result
struct MovieResult: Codable {
    let popularity: Double?
    let voteCount: Int?
    let posterPath: String?
    let id: Int
    let title: String
    let voteAverage: Int?
    let overview: String?
    let releaseDate: String?
}
