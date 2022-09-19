//
//  FetchRecentMovieQueriesUseCase.swift
//  marcuslecture
//
//  Created by Yunseong Hwang on 2022/09/11.
//

import Foundation


final class FetchRecentMovieQueriesUseCase : UseCase {
    struct RequestValue {
        let maxCount : Int
    }
    typealias ResultValue = (Result<[MovieQuery],Error))
}
