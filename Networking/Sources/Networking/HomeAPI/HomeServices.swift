//
//  File.swift
//  
//
//  Created by MEKARI on 07/03/22.
//

import Foundation

public protocol HomeServiceable {
    func getTopRatedMovies(completion: @escaping(Result<MovieResponse, RequestError>) -> Void)
}

public struct HomeServices: HomeServiceable {
    public init() {}
    private let networkManager = NetworkManager<HomeAPITargetType>()
    
    public func getTopRatedMovies(completion: @escaping (Result<MovieResponse, RequestError>) -> Void) {
        networkManager.request(target: .getTopRated, completion: completion)
    }

}
