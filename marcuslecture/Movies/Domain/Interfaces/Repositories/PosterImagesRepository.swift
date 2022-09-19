//
//  PosterImagesRepository.swift
//  marcuslecture
//
//  Created by Yunseong Hwang on 2022/09/11.
//

import Foundation

protocol PosterImagesRepository {
    func fetchImage(with imagePath: String, width: Int, completion: @escaping (Result<Data, Error>) -> Void) -> Cancellable?
}
