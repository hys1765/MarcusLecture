//
//  SearchMoviesUseCase.swift
//  marcuslecture
//
//  Created by Yunseong Hwang on 2022/09/11.
//

import Foundation

protocol SearchMovieUseCase{
    func execute(requestValue : SearchMovieUseCaseRequestValue,
                 cached : @escaping (MoviesPage) -> Void,
                 completion : @escaping (Result<MoviesPage, Error>) -> Void) -> Cancellable?
}

final class DefaultSearchMoviesUseCase : SearchMovieUseCase {
    private let moviesRepository : MoviesRepository
    private let movieQueriesRepository : MovieQueriesRepository
    
    init(movieRepository : MovieRepository, movieQueriesRepository : MovieQueriesRepository){
        self.moviesRepository = movieRepository
        self.movieQueriesRepository = movieQueriesRepository
        
    }
    func execute(requestValue: SearchMoviesUseCaseRequestValue,
                 cached: @escaping (MoviesPage) -> Void,
                 completion: @escaping (Result<MoviesPage, Error>) -> Void) -> Cancellable? {
        
        return moviesRepository.fetchMoviesList(query: requestValue.query,
                                                page: requestValue.page,
                                                cached: cached,
                                                completion: { result in
            
            if case .success = result {
                self.moviesQueriesRepository.saveRecentQuery(query: requestValue.query) { _ in }
            }
            
            completion(result)
        })
    }
}

struct SearchMoviesUseCaseRequestValue {
    let query : MovieQuery
    let page : Int
}
