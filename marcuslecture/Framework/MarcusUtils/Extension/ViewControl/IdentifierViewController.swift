//
//  IdentifierViewController.swift
//  marcuslecture
//
//  Created by Yunseong Hwang on 2022/10/03.
//

import UIKit

extension UIViewController{
    
    static func getViewController(_ StoryBoardId:String, _ VCId:String) -> BaseViewControl?{
        
        let storyboard = UIStoryboard(name: StoryBoardId, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: VCId) as? BaseViewControl ?? nil
        
        return vc
        
    }
}
