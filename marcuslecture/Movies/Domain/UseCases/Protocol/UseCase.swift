//
//  UseCase.swift
//  marcuslecture
//
//  Created by Yunseong Hwang on 2022/09/11.
//

import Foundation

public protocol UseCase {
    @discardableResult
    func start() -> Cancellable?
}
