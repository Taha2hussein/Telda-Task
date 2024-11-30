//
//  MovieRepository.swift
//  TeldaTask
//
//  Created by Taha Hussein on 28/11/2024.
//

import Combine
import Foundation

protocol MovieRepository {
    func fetchMovieList() -> AnyPublisher<MovieResponse, APIError>
    func searchMovie(query: String) -> AnyPublisher<MovieResponse, APIError>
    func fetchMovieDetails(movie_id: Int) -> AnyPublisher<MovieDetailResponse, APIError>
}

protocol HasMovieRepository {
    var movieRepository: MovieRepository { get }
}
