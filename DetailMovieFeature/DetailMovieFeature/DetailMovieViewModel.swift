//
//  DetailMovieViewModel.swift
//  DetailMovieFeature
//
//  Created by MEKARI on 08/03/22.
//

import Foundation
import Networking

protocol DetailMovieViewModelProtocol: AnyObject {
    func reloadTableView()
}

class DetailMovieViewModel {
    private var services: DetailMovieServiceable
    weak var delegate: DetailMovieViewModelProtocol?
    var movieId: Int?
    var movieResult: MovieResults?
    
    init(services: DetailMovieServiceable) {
        self.services = services
    }
    
    func getDetailMovie() {
        guard let movieId = movieId else {
            return
        }
        
        services.getDetailMovie(movieId: movieId) { [weak self] result in
            switch result {
            case .success(let movieResult):
                self?.movieResult = movieResult
                self?.delegate?.reloadTableView()
            case .failure(let error):
                print("Ahmad", error)
                break
            }
        }
    }
}
