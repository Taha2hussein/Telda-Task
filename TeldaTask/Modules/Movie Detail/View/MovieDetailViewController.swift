//
//  MovieDetailViewController.swift
//  TeldaTask
//
//  Created by Taha Hussein on 30/11/2024.
//

import UIKit
import Combine
class MovieDetailViewController: BaseViewController {

    var movieId: Int = 0
    private var movieDetailViewModel: MovieDetailViewModel?
    private var cancellables = Set<AnyCancellable>()
    
    @IBOutlet var movie: [UILabel]!
    @IBOutlet weak var movieImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieDetailViewModel = MovieDetailViewModel()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        movieDetailViewModel?.fetchMovieDetail(movie_id: movieId)
    }
    
    private func bindViewModel() {
        movieDetailViewModel?.movieDetailPublisher
            .receive(on: DispatchQueue.main) // Ensure updates happen on the main thread
            .sink { [weak self] result in
                switch result {
                case .success(let movieDetail):
                    self?.updateUI(with: movieDetail)
                case .failure(let error):
                    self?.handleError(error)
                }
            }
            .store(in: &cancellables)
    }
    
    private func updateUI(with movieDetail: MovieDetailResponse) {
        // Update UI elements with movie details
        // Assuming `MovieDetailResponse` has `title`, `description`, and `imageUrl` properties
        movie[0].text = "Title: \(movieDetail.title ?? "N/A")"
        movie[1].text = "Description: \(movieDetail.overview ?? "N/A")"
        movie[2].text = "Release Date: \(movieDetail.status ?? "N/A")"
        
        // Load image asynchronously
        if let imageUrl = movieDetail.homepage, let url = URL(string: "\(EnviromentConfigurations.imageUrl.rawValue)\(imageUrl)") {
            loadImage(from: url)
        }
    }
    
    private func handleError(_ error: APIError) {
        self.getShowAlert(str: error.localizedDescription)
    }
    
    private func loadImage(from url: URL) {
        CImageLoader.shared.loadImage(from: url)
            .sink(receiveValue: { [weak self] image in
                DispatchQueue.main.async {
                    self?.movieImageView.image = image
                }
            })
            .store(in: &cancellables)
    }

}
