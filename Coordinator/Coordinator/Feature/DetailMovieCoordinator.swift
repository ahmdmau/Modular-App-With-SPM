//
//  DetailMovieCoordinator.swift
//  Coordinator
//
//  Created by MEKARI on 08/03/22.
//

import UIKit
import DetailMovieFeature

public class DetailMovieCoordinator: Coordinator {
    public var childCoordinators = [Coordinator]()
    public var navigationController: UINavigationController
    public var movieId: Int
    public var movieTitle: String
    
    public init(navigationController: UINavigationController, movieId: Int, movieTitle: String) {
        self.navigationController = navigationController
        self.movieId = movieId
        self.movieTitle = movieTitle
    }
    
    public func start() {
        let movieDetailViewController = DetailMovieViewController(movieId: movieId, movieTitle: movieTitle)
        self.navigationController.pushViewController(movieDetailViewController, animated: true)
    }
}
