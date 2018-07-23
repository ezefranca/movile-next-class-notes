//
//  Movie.swift
//  TopMovies
//
//  Created by Ezequiel on 21/07/18.
//  Copyright © 2018 Barbara Gomes. All rights reserved.
//

import Foundation

struct Movie : Codable {
    
    fileprivate let title : String?
    fileprivate let categories : [String]?
    fileprivate let duration : String?
    fileprivate let rating : Double?
    fileprivate let summary : String?
    fileprivate let image : String?
    fileprivate let itemType : ItemType?
    let items: [Movie]?
    
    var `movieCategories`: String {
        return categories?.joined(separator: " | ") ?? ""
    }
    
    var `movieRating`: String {
        return "⭐️ \(self.rating ?? 0.0)/10"
    }
    
    var `movieImage`: String {
        return (image ?? "") + "small"
    }
    
    var `movieTitle`: String {
        return title ?? ""
    }
    
    var `movieSummary`: String {
        return summary ?? ""
    }
    
    var `movieDuration`: String {
        return duration ?? ""
    }
    
    var `lancamentos`: [Movie] {
        return self.items ?? []
    }
    
    var `reuseIdentifier`: String {
        return self.itemType?.rawValue ?? "cell"
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case categories
        case duration
        case rating
        case summary = "description"
        case image
        case itemType
        case items
    }
}

enum ItemType: String, Codable {
    case movie = "movie"
    case list = "list"
}
