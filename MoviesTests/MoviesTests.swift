//
//  MoviesTests.swift
//  MoviesTests
//
//  Created by Burak Donat on 27.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import XCTest
@testable import Movies

class MoviesTests: XCTestCase {

    func testParsingMovie() throws {
        
        let bundle = Bundle(for: MoviesTests.self)
        let url =  bundle.url(forResource: "movie", withExtension: "json")!
        let data = try Data(contentsOf: url)
        let movie = try JSONDecoder().decode(MovieResult.self, from: data)
        
        XCTAssertEqual(movie.title , "Infamous")
        XCTAssertEqual(movie.vote_average , 5.2)
        XCTAssertEqual(movie.release_date , "2020-06-12")
        XCTAssertEqual(movie.id , 703134)
    }
}
