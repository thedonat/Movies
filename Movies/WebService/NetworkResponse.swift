//
//  NetworkResponse.swift
//  Movies
//
//  Created by Burak Donat on 26.09.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

enum NetworkResponse<T, U: Error> {
    case success(T)
    case failure(U)
}
