//
//  MovieDetailResponse.swift
//  TeldaTask
//
//  Created by Taha Hussein on 30/11/2024.
//

import Foundation

// MARK: - MovieDetailResponse
struct MovieDetailResponse: Decodable {
    var adult: Bool?
    var backdropPath: String?
    var belongsToCollection: BelongsToCollection?
    var budget: Int?
    var genres: [Genre]?
    var homepage: String?
    var id: Int?
    var imdbID: String?
    var originCountry: [String]?
    var originalLanguage, originalTitle, overview: String?
    var popularity: Double?
    var posterPath: String?
    var productionCompanies: [ProductionCompany]?
    var productionCountries: [ProductionCountry]?
    var releaseDate: String?
    var revenue, runtime: Int?
    var spokenLanguages: [SpokenLanguage]?
    var status, tagline, title: String?
    var video: Bool?
    var voteAverage: Double?
    var voteCount: Int?
}

// MARK: - BelongsToCollection
struct BelongsToCollection: Decodable {
    var id: Int?
    var name, posterPath, backdropPath: String?
}

// MARK: - Genre
struct Genre: Decodable  {
    var id: Int?
    var name: String?
}

// MARK: - ProductionCompany
struct ProductionCompany: Decodable  {
    var id: Int?
    var logoPath: String?
    var name, originCountry: String?
}

// MARK: - ProductionCountry
struct ProductionCountry: Decodable  {
    var iso3166_1, name: String?
}

// MARK: - SpokenLanguage
struct SpokenLanguage: Decodable  {
    var englishName, iso639_1, name: String?
}
