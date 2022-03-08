//
//  HomeViewModel.swift
//  HomeFeature
//
//  Created by MEKARI on 08/03/22.
//

import Foundation
import Networking

protocol HomeViewModelProtocol: AnyObject {
    func reloadTableView()
}

class HomeViewModel {
    private var services: HomeServiceable
    weak var delegate: HomeViewModelProtocol?
    var movieResults: [MovieResults] = []
    
    init(services: HomeServiceable) {
        self.services = services
    }
    
    func getTopRatedMovies() {
        services.getTopRatedMovies { [weak self] response in
            switch response {
            case .success(let movie):
                self?.movieResults = movie.results ?? []
                self?.delegate?.reloadTableView()
            case .failure(let error):
                print("AM debug", error)
            }
        }
    }
    
}
