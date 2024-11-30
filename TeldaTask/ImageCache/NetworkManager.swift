//
//  NetworkManager.swift
//  TeldaTask
//
//  Created by Taha Hussein on 28/11/2024.
//

import Combine
import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    private let session = URLSession.shared
    private let maxRetries = 3

    func cleanURL(_ urlString: String) -> String? {
        guard var components = URLComponents(string: urlString) else {
            print("Invalid URLComponents: \(urlString)")
            return nil
        }
        
        // Remove double slashes from the path
        components.path = components.path.replacingOccurrences(of: "//", with: "/")
        
        print("Cleaned URL: \(components.string ?? "nil")")
        return components.string
    }

    func downloadImage(with urlString: String) -> AnyPublisher<UIImage?, Error> {
        guard let cleanedURLString = cleanURL(urlString),
              let url = URL(string: cleanedURLString) else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        print("Downloading image from URL: \(url)")
        
        return session.dataTaskPublisher(for: url)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    throw URLError(.badServerResponse)
                }
                guard let image = UIImage(data: data) else {
                    throw URLError(.cannotDecodeContentData)
                }
                return image
            }
            .retry(maxRetries)
            .eraseToAnyPublisher()
    }
}
