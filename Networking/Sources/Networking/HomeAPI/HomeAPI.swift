//
//  File.swift
//  
//
//  Created by MEKARI on 07/03/22.
//

import Foundation
import Moya

public enum HomeAPITargetType {
    case getTopRated
}

extension HomeAPITargetType: NetworkTargetType {
    
    public var path: String {
        return "movie/top_rated"
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
