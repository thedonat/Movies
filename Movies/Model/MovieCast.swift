//
//  MovieCast.swift
//  Movies
//
//  Created by Burak Donat on 26.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

// MARK: - MovieCast
struct MovieCast: Decodable {
    let cast: [Cast]
}

// MARK: - Cast
struct Cast: Decodable {
    let character: String?
    let name: String?
    let profile_path: String?
}
