//
//  HomeCoordinator.swift
//  Coordinator
//
//  Created by MEKARI on 08/03/22.
//

import UIKit
import HomeFeature

public class HomeCoordinator: Coordinator {
    
    public var childCoordinators = [Coordinator]()
    public var navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let homeViewController = HomeViewController()
        homeViewController.title = "List Movie"
        homeViewController.delegate = self
        self.navigationController.pushViewController(homeViewController, animated: true)
    }

}

extension HomeCoordinator: HomeCoordinatorDelegate {
    
    public func routeToDetail(with movieId: Int, title: String) {
        let detailMovieCoordinator = DetailMovieCoordinator(navigationController: self.navigationController, movieId: movieId, movieTitle: title)
        childCoordinators.append(detailMovieCoordinator)
        detailMovieCoordinator.start()
    }
    
}
