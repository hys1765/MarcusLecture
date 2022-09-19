//
//  SpalshViewController.swift
//  marcuslecture
//
//  Created by Yunseong Hwang on 2022/09/18.
//

import UIKit

class SpalshViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    
    private func setup() {
        // 1초 후에 실행
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1){
            self.performSegue(withIdentifier: "LoginSeque", sender: nil)
        }
    }
}
