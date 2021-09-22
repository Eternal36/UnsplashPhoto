//
//  Result.swift
//  UnsplashPhoto
//
//  Created by Дмитрий Бельков on 21.09.2021.
//

import Foundation

struct Results: Decodable {
    var total: Int
    var total_pages: Int
    var results: [Result]
}

struct Result: Decodable {
    var urls: URLs
}

struct URLs: Decodable {
    var regular: String
}
