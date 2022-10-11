//
//  FeedDetailViewController.swift
//  marcuslecture
//
//  Created by Yunseong Hwang on 2022/10/10.
//

import UIKit
import RxSwift

class FeedDetailViewController: UIViewController {

    var viewModel :FeedDetailViewModel?
    var mFeed : FeedGalleryModel?
    var disposeBag = DisposeBag()
    
    @IBOutlet weak var feedImg: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSetting()
        // Do any additional setup after loading the view.
    }
    
    private func initSetting(){
        feedImg.image = UIImage(named: mFeed?.feedImg ?? "")
        feedImg.translatesAutoresizingMaskIntoConstraints = false
    }
    

    @IBAction func onClickClose(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
