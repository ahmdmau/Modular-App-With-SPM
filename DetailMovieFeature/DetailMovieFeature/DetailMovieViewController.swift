//
//  DetailMovieViewController.swift
//  DetailMovieFeature
//
//  Created by MEKARI on 08/03/22.
//

import UIKit
import Networking

public class DetailMovieViewController: UIViewController {
    
    // MARK: - Properties
    private let viewModel = DetailMovieViewModel(services: DetailMovieServices())
    @IBOutlet weak var tableView: UITableView!
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: "DetailMovieViewController", bundle: Bundle(for: DetailMovieViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public convenience init(movieId: Int, movieTitle: String) {
        self.init()
        self.viewModel.movieId = movieId
        self.title = movieTitle
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        setupTableView()
    }
    
}

extension DetailMovieViewController {
    
    private func setupViewModel() {
        viewModel.delegate = self
        viewModel.getDetailMovie()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DetailMovieTableViewCell.nib(), forCellReuseIdentifier: DetailMovieTableViewCell.identifier)
    }
    
}

extension DetailMovieViewController: UITableViewDataSource, UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailMovieTableViewCell.identifier, for: indexPath) as? DetailMovieTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(backdropURL: viewModel.movieResult?.backdropPath ?? "",
                       title: viewModel.movieResult?.title ?? "-",
                       overview: viewModel.movieResult?.overview ?? "-")
        cell.selectionStyle = .none
        return cell
    }
}

extension DetailMovieViewController: DetailMovieViewModelProtocol {
    
    func reloadTableView() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
}
