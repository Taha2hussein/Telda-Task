//
//  MovieListViewController.swift
//  TeldaTask
//
//  Created by Taha Hussein on 29/11/2024.
//


import UIKit
import Combine

class MovieListViewController: BaseViewController {

    
    @IBOutlet weak var SearchView: SearchBarView!
    @IBOutlet weak var movieTableView: UITableView!
    private var movieListViewModel: MovieListViewModel?
    private var movies: [Movie] = []
    private var cancellables = Set<AnyCancellable>()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        movieListViewModel = MovieListViewModel()
        setUp()
        bindData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        movieListViewModel?.fetchMovieList()
    }
    
    func setUp() {
        movieTableView.delegate = self
        movieTableView.dataSource = self
        movieTableView.register(UINib(nibName: AppConstants.movieCell.rawValue, bundle: nil), forCellReuseIdentifier: AppConstants.movieCell.rawValue)
        SearchView.delegate = self
    }
    
    func bindData() {
        movieListViewModel?.movieListPublisher
            .sink(receiveValue: { [weak self] result in
                switch result {
                case .success(let movieResponse):
                        self?.movies = movieResponse.results ?? []
                        self?.movieTableView.reloadData()
                    
                case .failure(let error):
                    self?.getShowAlert(str: error.localizedDescription)
                }
            })
            .store(in: &cancellables)
    }
}

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.movieCell.rawValue, for: indexPath) as! MovieListTableViewCell
        
        let movie = movies[indexPath.row]
        cell.config(movie: movie)
   
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle cell selection if needed
        let selectedMovie = movies[indexPath.row]
    }
}

extension MovieListViewController: SearchBarViewDelegate {
    func didSearchTextChanged(_ text: String) {
        print(text , "textttt")
    }
    
    func didTapSearchButton(with text: String) {
         let text = trimText(text)
        movieListViewModel?.searchMovie(query: text)
    }
}
