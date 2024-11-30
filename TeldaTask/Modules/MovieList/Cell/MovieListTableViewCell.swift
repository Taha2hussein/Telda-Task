//
//  MovieListTableViewCell.swift
//  TeldaTask
//
//  Created by Taha Hussein on 30/11/2024.
//

import UIKit
import Combine

class MovieListTableViewCell: UITableViewCell {
    private var cancellables = Set<AnyCancellable>()
    
    @IBOutlet weak var moviewYear: UILabel!
    @IBOutlet weak var moviewOverView: UILabel!
    @IBOutlet weak var moviewTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func config(movie:Movie) {
        self.moviewTitle.text = movie.title
        self.moviewOverView.text = movie.overview
        self.moviewYear.text = movie.releaseDate
        if let posterPath = movie.posterPath, let url = URL(string: "\(EnviromentConfigurations.imageUrl.rawValue)\(posterPath)") {
            loadImage(from: url)
        }
    }
    
    private func loadImage(from url: URL) {
        // Use CImageLoader to load the image
        CImageLoader.shared.loadImage(from: url)
            .sink(receiveValue: { [weak self] image in
                DispatchQueue.main.async {
                    self?.movieImage.image = image
                }
            })
            .store(in: &cancellables)
    }
}
