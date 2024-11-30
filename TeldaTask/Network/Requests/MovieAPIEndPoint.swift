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
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .movieList,.movieSearch:
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
            
        }
    }
    
    var headers: [String: String] {
        switch self {
        case .movieList,.movieSearch:
            return HeadersRequest.shared.getHeaders(type: .normal)
        }
    }
}
