//
//  Header.swift
//  TeldaTask
//
//  Created by Taha Hussein on 28/11/2024.
//

import Alamofire

enum HeaderType {
    case normal
    case refreshToken
}

class HeadersRequest {
    static let shared = HeadersRequest()
    
    func getHeaders(type: HeaderType) -> [String: String] {
        var httpHeaders = [String: String]()
        
        if type == .normal {
            httpHeaders = [
                "Accept":"application/json",
                "Accept-Language":"en",
                "Content-Type":"application/json",
                "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYTMxMDZkNWUyYWRlNmIwMWY2NGYyZWJiMWYwYmNjZSIsIm5iZiI6MTczMjgwMzk5MS45MTI3MzU1LCJzdWIiOiI1ZjQ2YmUyNDBkMTFmMjAwMzFiY2JlYjUiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.o1RbXSd9Uxvm68jbooskTMVe1QHPXfTQo6hS06Bt8HU"
          
            ]
        } else if type == .refreshToken {
            httpHeaders = [
                "Accept":"application/json",
                "Accept-Language":"en",
                "Content-Type":"application/json",
                "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYTMxMDZkNWUyYWRlNmIwMWY2NGYyZWJiMWYwYmNjZSIsIm5iZiI6MTczMjgwMzk5MS45MTI3MzU1LCJzdWIiOiI1ZjQ2YmUyNDBkMTFmMjAwMzFiY2JlYjUiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.o1RbXSd9Uxvm68jbooskTMVe1QHPXfTQo6hS06Bt8HU"
            ]
        }
        
        return httpHeaders
    }
}
