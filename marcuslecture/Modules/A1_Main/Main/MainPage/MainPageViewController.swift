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

        // Do any additional setup after loading the view.
    }
    
    func initSetting(){
        let vcFeed = UIViewController.getViewController("MainStoryBoard", "FeedStoryBoard")
        let vcPencil = UIViewController.getViewController("MainStoryBoard", "PencilStoryBoard")
        let vcProfile = UIViewController.getViewController("MainStoryBoard", "ProfileStoryBoard")
        
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
