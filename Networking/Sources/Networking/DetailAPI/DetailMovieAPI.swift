//
//  File.swift
//  
//
//  Created by MEKARI on 08/03/22.
//

import Foundation
import Moya

public enum DetailMovieAPITargetType {
    case getTopRated(movieId: Int)
}

extension DetailMovieAPITargetType: NetworkTargetType {
    
    public var path: String {
        switch self {
        case .getTopRated(let movieId):
            return "movie/\(movieId)"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var task: Task {
        return .requestParameters(parameters: ["api_key": "45e5d6363dec05a53f59bcc6af7e551f"], encoding: URLEncoding.queryString)
    }
    
    public var headers: [String : String]? {
        return nil
    }
    
}
