//
//  HomeViewController.swift
//  HomeFeature
//
//  Created by MEKARI on 08/03/22.
//

import UIKit
import Networking

public protocol HomeCoordinatorDelegate: AnyObject {
    func routeToDetail(with movieId: Int, title: String)
}

public class HomeViewController: UIViewController {
    
    // MARK: - Properties
    private let viewModel = HomeViewModel(services: HomeServices())
    public weak var delegate: HomeCoordinatorDelegate?
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: "HomeViewController", bundle: Bundle(for: HomeViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupViewModel()
    }

}

// MARK: - Methods
extension HomeViewController {
    
    private func setupViewModel() {
        viewModel.delegate = self
        viewModel.getTopRatedMovies()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ListMovieTableViewCell.nib(), forCellReuseIdentifier: ListMovieTableViewCell.identifier)
    }
    
}

// MARK: - UITableView Delegate & Datasource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movieResults.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListMovieTableViewCell.identifier, for: indexPath) as? ListMovieTableViewCell
        else {
            return UITableViewCell()
        }
        
        let movie = viewModel.movieResults[indexPath.row]
        
        cell.configure(posterUrl: movie.posterPath ?? "",
                       movieTitle: movie.title ?? "-",
                       movieDate: movie.releaseDate ?? "-",
                       movieDuration: movie.originalLanguage ?? "-")
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = viewModel.movieResults[indexPath.row]
        guard let movieId = movie.id, let movieTitle = movie.title else {
            return
        }
        delegate?.routeToDetail(with: movieId, title: movieTitle)
    }
    
}

extension HomeViewController: HomeViewModelProtocol {
    func reloadTableView() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
}
