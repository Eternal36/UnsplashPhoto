//
//  Result.swift
//  UnsplashPhoto
//
//  Created by Дмитрий Бельков on 21.09.2021.
//

import Foundation

struct Results: Codable {
    var total: Int
    var results: [Result]
}

struct Result: Codable {
    var id: String
    var description: String
    var urls: [URLs]
}

struct URLs: Codable {
    var full: String
}
