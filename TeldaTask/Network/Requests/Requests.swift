//
//  MovieAPI.swift
//  TeldaTask
//
//  Created by Taha Hussein on 28/11/2024.
//

import Combine
import Foundation

struct MovieAPI: MovieRepository {
    
    let client: Client
    
    init(client: Client = moyaProvider) {
        self.client = client
    }
    
    func fetchMovieList() -> AnyPublisher<MovieResponse, APIError> {
        return self.client.performRequest(api: MovieAPIEndPoint.movieList, decodeTo: MovieResponse.self)
    }
    
    func searchMovie(query: String) -> AnyPublisher<MovieResponse, APIError> {
        return self.client.performRequest(api: MovieAPIEndPoint.movieSearch(query: query), decodeTo: MovieResponse.self)

    }
    
    func fetchMovieDetails(movie_id: Int) -> AnyPublisher<MovieDetailResponse, APIError> {
        return self.client.performRequest(api: MovieAPIEndPoint.movieDtail(movie_id: movie_id), decodeTo: MovieDetailResponse.self)

    }
    
    
}
