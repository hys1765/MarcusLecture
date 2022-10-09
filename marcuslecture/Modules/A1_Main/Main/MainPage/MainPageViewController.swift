//
//  MainPageViewController.swift
//  marcuslecture
//
//  Created by Yunseong Hwang on 2022/09/29.
//

import UIKit

class MainPageViewController: BasePageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initSetting()
      
        // Do any additional setup after loading the view.
    }
    
    func initSetting(){
        let vcFeed = UIViewController.getViewController("MainStoryBoard", "FeedStoryBoard") as! FeedViewController
        let vcPencil = UIViewController.getViewController("MainStoryBoard", "PencilStoryBoard") as! PencilViewController
        let vcProfile = UIViewController.getViewController("MainStoryBoard", "ProfileStoryBoard") as! ProfileViewController
        addVC(addList: [vcFeed, vcPencil, vcProfile])
        removeSwipeGesture()
        removePagingGesture()
    }
}
