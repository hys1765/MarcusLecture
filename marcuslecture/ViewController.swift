//
//  ViewController.swift
//  marcuslecture
//
//  Created by Yunseong Hwang on 2022/08/30.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var lbl1: UILabel!

    @IBAction func onBtnClk1(_ sender: Any) {
        lbl1.text = "첫번째 버튼"
    }
    @IBAction func onBtnClk2(_ sender: Any) {
        lbl1.text = "두번째 버튼"
    }
    @IBAction func onBtnClk3(_ sender: Any) {
        lbl1.text = "세번째 버튼"
    }
}

