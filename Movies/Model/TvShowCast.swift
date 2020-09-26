//
//  TvShowCast.swift
//  Movies
//
//  Created by Burak Donat on 26.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct TvShowCast: Decodable {
    let cast: [ShowCast]
}

// MARK: - Cast
struct ShowCast: Decodable {
    let character: String?
    let name: String?
    let profile_path: String?
}
