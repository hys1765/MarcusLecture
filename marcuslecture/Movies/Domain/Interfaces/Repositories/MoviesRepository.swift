//
//  MoviesRepository.swift
//  marcuslecture
//
//  Created by Yunseong Hwang on 2022/09/11.
//

import Foundation

protocol MoviesRepository {
   @discardableResult
    func fetchMoviesList(query : MovieQuery, page : Int,
                         cached : @escaping (MoviesPage) -> Void,
                         completion : @escaping (Result<MoviesPage, Error>) -> Void) -> Cancellable?
    
}
