//
//  File.swift
//  
//
//  Created by MEKARI on 07/03/22.
//

import Foundation

public struct MovieResponse: Codable {
    
    enum CodingKeys: String, CodingKey {
        case results
        case totalPages = "total_pages"
        case page
        case totalResults = "total_results"
    }
    
    public var results: [MovieResults]?
    var totalPages: Int?
    var page: Int?
    var totalResults: Int?
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        results = try container.decodeIfPresent([MovieResults].self, forKey: .results)
        totalPages = try container.decodeIfPresent(Int.self, forKey: .totalPages)
        page = try container.decodeIfPresent(Int.self, forKey: .page)
        totalResults = try container.decodeIfPresent(Int.self, forKey: .totalResults)
    }
    
}


// MARK: - Result
public struct MovieResults: Codable {
    
    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case video
        case adult
        case backdropPath = "backdrop_path"
        case popularity
        case originalTitle = "original_title"
        case id
        case overview
        case originalLanguage = "original_language"
        case title
        case releaseDate = "release_date"
        case genreIds = "genre_ids"
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
    }
    
    public var posterPath: String?
    public var video: Bool?
    public var adult: Bool?
    public var backdropPath: String?
    public var popularity: Float?
    public var originalTitle: String?
    public var id: Int?
    public var overview: String?
    public var originalLanguage: String?
    public var title: String?
    public var releaseDate: String?
    public var genreIds: [Int]?
    public var voteCount: Int?
    public var voteAverage: Float?
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
        video = try container.decodeIfPresent(Bool.self, forKey: .video)
        adult = try container.decodeIfPresent(Bool.self, forKey: .adult)
        backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
        popularity = try container.decodeIfPresent(Float.self, forKey: .popularity)
        originalTitle = try container.decodeIfPresent(String.self, forKey: .originalTitle)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        overview = try container.decodeIfPresent(String.self, forKey: .overview)
        originalLanguage = try container.decodeIfPresent(String.self, forKey: .originalLanguage)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate)
        genreIds = try container.decodeIfPresent([Int].self, forKey: .genreIds)
        voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount)
        voteAverage = try container.decodeIfPresent(Float.self, forKey: .voteAverage)
    }
    
}
