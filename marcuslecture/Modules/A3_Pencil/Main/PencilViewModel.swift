//
//  PencilViewModel.swift
//  marcuslecture
//
//  Created by Yunseong Hwang on 2022/09/30.
//
import Alamofire
import Foundation

class PencilViewModel {
    
    func getTest(){
        let url = "https://jsonplaceholder.typicode.com/todos/1"
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: ["Content-Type": "application/json",
                             "Accept":"application/json"]
        ).validate(statusCode: 200..<300)
            .responseJSON{
                json in print(json)
            }
    }
}

