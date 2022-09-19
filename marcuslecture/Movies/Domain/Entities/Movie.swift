//
//  Movie.swift
//  marcuslecture
//
//  Created by Yunseong Hwang on 2022/09/11.
//

import Foundation

struct Movie: Equatable, Identifiable{
    typealias identifier = String
    enum Genre {
        case adventure
        case scienceFiction
    }
    let id : identifier
    let title : String?
    let genre : Genre?
    let posterPath: String?
    let overview : String?
    let releaseDate : Date?
}

struct MoviesPage : Equatable {
    let page: Int
    let totalPages : Int
    let movies : [Movie]
}
