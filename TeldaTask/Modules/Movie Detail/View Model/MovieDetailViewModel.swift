//
//  MovieDetailViewModel.swift
//  TeldaTask
//
//  Created by Taha Hussein on 30/11/2024.
//

import Foundation
import Combine

protocol MovieDetailViewProtocol {
    func fetchMovieDetail(movie_id: Int)
}

class MovieDetailViewModel: MovieDetailViewProtocol {
    
    private var cancellables = Set<AnyCancellable>()
    var movieDetailPublisher: PassthroughSubject<Result<MovieDetailResponse, APIError>, Never> = PassthroughSubject()
    
    func fetchMovieDetail(movie_id: Int) {
        dependencies.movieRepository.fetchMovieDetails(movie_id: movie_id)

            .catch { error -> Just<MovieDetailResponse> in
                print("Error fetching movies: \(error.localizedDescription)")
                self.movieDetailPublisher.send(.failure(.otherError(message: error.localizedDescription)))
                
                return Just(MovieDetailResponse())
            }
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Finished fetching movie list.")
                case .failure:
                    break
                }
            }, receiveValue: { response in
                print(response, "responses")
                self.movieDetailPublisher.send(.success(response))
            })
            .store(in: &cancellables)
    }
    
    
}
