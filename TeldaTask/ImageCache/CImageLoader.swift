//
//  CImageLoader.swift
//  TeldaTask
//
//  Created by Taha Hussein on 28/11/2024.
//

import Combine
import UIKit

class CImageLoader {
    static let shared = CImageLoader()
    private init() {}
    
    private var subscriptions = Set<AnyCancellable>()
    
    func loadImage(from url: URL, placeholder: UIImage? = nil) -> AnyPublisher<UIImage?, Never> {
        // Check if the image is already cached
        if let cachedImage = ImageCache.shared.getImage(forKey: url.absoluteString) {
            return Just(cachedImage)
                .eraseToAnyPublisher()
        }
        
        // Start downloading the image
        return NetworkManager.shared.downloadImage(with: url.absoluteString)
            .handleEvents(receiveOutput: { image in
                if let image = image {
                    ImageCache.shared.setImage(image, forKey: url.absoluteString)
                }
            })
            .replaceError(with: nil)
            .eraseToAnyPublisher()
    }
}
