//
//  AppDependencies.swift
//  TeldaTask
//
//  Created by Taha Hussein on 28/11/2024.
//

import Foundation

class AppDependencies:  HasMovieRepository {
    var movieRepository: MovieRepository

    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository

    }
}

extension AppDependencies {
    static var shared: AppDependencies {
        AppDependencies(
            movieRepository: MovieAPI()

        )
    }
}

// we make dependencies `var` when we are in debug mode, since changing dependencies should only be used for testing purposes only
#if DEBUG
var dependencies: AppDependencies = .shared
#else
let dependencies: AppDependencies = .shared
#endif
