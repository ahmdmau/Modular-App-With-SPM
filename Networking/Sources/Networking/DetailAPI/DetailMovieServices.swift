//
//  File.swift
//  
//
//  Created by MEKARI on 08/03/22.
//

import Foundation

public protocol DetailMovieServiceable {
    func getDetailMovie(movieId: Int, completion: @escaping(Result<MovieResults, RequestError>) -> Void)
}

public struct DetailMovieServices: DetailMovieServiceable {
    public init() {}
    private let networkManager = NetworkManager<DetailMovieAPITargetType>()
    
    public func getDetailMovie(movieId: Int, completion: @escaping (Result<MovieResults, RequestError>) -> Void) {
        networkManager.request(target: .getTopRated(movieId: movieId), completion: completion)
    }
}
