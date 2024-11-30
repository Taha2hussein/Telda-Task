//
//  MovieResponse.swift
//  TeldaTask
//
//  Created by Taha Hussein on 29/11/2024.
//

import Foundation
//
//// The response structure conforming to Decodable
//struct MovieResponse: Decodable {
//    var page: Int?
//    var results: [Movie]
//    var totalPages, totalResults: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case page, results, totalPages = "total_pages", totalResults = "total_results"
//    }
//}
//
//// Movie struct that conforms to Decodable
//struct Movie: Decodable {
//    var adult: Bool?
//    var backdropPath: String?
//    var genreIDS: [Int]?
//    var id: Int?
//    var originalLanguage: OriginalLanguage?
//    var originalTitle, overview: String?
//    var popularity: Double?
//    var posterPath, releaseDate, title: String?
//    var video: Bool?
//    var voteAverage: Double?
//    var voteCount: Int?
//
//    // Custom CodingKeys to handle the naming convention in JSON
//    enum CodingKeys: String, CodingKey {
//        case adult
//        case backdropPath = "backdrop_path"
//        case genreIDS = "genre_ids"
//        case id
//        case originalLanguage = "original_language"
//        case originalTitle = "original_title"
//        case overview
//        case popularity
//        case posterPath = "poster_path"
//        case releaseDate = "release_date"
//        case title
//        case video
//        case voteAverage = "vote_average"
//        case voteCount = "vote_count"
//    }
//}
//
//// Enum for original language
//enum OriginalLanguage: String, Decodable {
//    case en
//    case es
//    case te
//    case tl
//}
struct MovieResponse: Decodable {
    var page: Int?
    var results: [Movie]?
    var totalPages, totalResults: Int?
    var status_message: String?
    var status_code: Int?
    var success: Bool?
    enum CodingKeys: String, CodingKey {
        case page, results, totalPages = "total_pages", totalResults = "total_results"
    }
}

struct Movie: Decodable {
    var adult: Bool?
    var backdropPath: String?
    var genreIDS: [Int]?
    var id: Int?
    var originalTitle, overview: String?
    var popularity: Double?
    var posterPath, releaseDate, title: String?
    var video: Bool?
    var voteAverage: Double?
    var voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
