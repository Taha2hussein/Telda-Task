//
//  MovieAPIEndPoint.swift
//  TeldaTask
//
//  Created by Taha Hussein on 28/11/2024.
//

import Foundation
import Moya
enum MovieAPIEndPoint {
    case movieList
    case movieSearch(query: String)
    case movieDtail(movie_id: Int)
}

extension MovieAPIEndPoint: APIEndpoint {
    var baseURL: URL {
        return URL(string: EnviromentConfigurations.baseUrl.rawValue)!
    }
    
    var path: String {
        switch self {
        case .movieList:
            return  "movie/popular"
        case .movieSearch:
            return "search/movie"
        case .movieDtail(let movie_id):
            return "/movie/\(movie_id)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .movieList,.movieSearch,.movieDtail:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .movieList:
            return .requestPlain
        case .movieSearch(let query):
            let urlParameters: [String: Any] = [
                "query": query
            ]
            return .requestParameters(parameters: urlParameters, encoding: .queryString)
            
        case .movieDtail(let movieId):
            return .requestPlain
        }
    }
    
    var headers: [String: String] {
        switch self {
        case .movieList,.movieSearch,.movieDtail:
            return HeadersRequest.shared.getHeaders(type: .normal)
        }
    }
}
