//
//  MovieListViewModel.swift
//  TeldaTask
//
//  Created by Taha Hussein on 29/11/2024.
//

import Combine

protocol MovieProtocol {
    func fetchMovieList()
    func searchMovie(query: String)
    
}

class MovieListViewModel: MovieProtocol {
   
    private var cancellables = Set<AnyCancellable>()
    var movieListPublisher: PassthroughSubject<Result<MovieResponse, APIError>, Never> = PassthroughSubject()
    private var movieList: MovieResponse!
    func fetchMovieList() {
        dependencies.movieRepository.fetchMovieList()

            .catch { error -> Just<MovieResponse> in
                print("Error fetching movies: \(error.localizedDescription)")
                self.movieListPublisher.send(.failure(.otherError(message: error.localizedDescription)))
                
                return Just(MovieResponse(page: 0, results: []))
            }
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Finished fetching movie list.")
                case .failure:
                    break
                }
            }, receiveValue: { response in
                self.movieList = response
                self.movieListPublisher.send(.success(response))
            })
            .store(in: &cancellables)
    }
    
    func searchMovie(query: String) {
        guard query != "" else {
            self.movieListPublisher.send(.success(self.movieList))
            return
        }
        dependencies.movieRepository.searchMovie(query: query)

            .catch { error -> Just<MovieResponse> in
                print("Error fetching movies: \(error.localizedDescription)")
                self.movieListPublisher.send(.failure(.otherError(message: error.localizedDescription)))
                
                return Just(MovieResponse(page: 0, results: []))
            }
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Finished fetching movie list.")
                case .failure:
                    break
                }
            }, receiveValue: { response in
                
                self.movieListPublisher.send(.success(response))
            })
            .store(in: &cancellables)
    }
}
