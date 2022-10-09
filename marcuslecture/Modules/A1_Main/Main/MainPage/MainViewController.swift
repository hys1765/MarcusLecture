//
//  MainViewController.swift
//  marcuslecture
//
//  Created by Yunseong Hwang on 2022/10/03.
//

import UIKit

class MainViewController : BaseViewControl {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup(){
//        let router = MainRouter()
//        viewController.router = router
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        if let scene = segue.identifier{
        //            let selector = NSSelectorFromString("routeTo\(scene)WithSegue")
        //        }
        //        if let router = router,
    }
    
  
    override func viewDidLoad() {
        MainViewController.mainInstance = self
        initSetting()
    }
    
    
    @IBOutlet weak var buttonFeed: UIButton!
    @IBOutlet weak var buttonPencil: UIButton!
    @IBOutlet weak var buttonProfile: UIButton!
    
    var pageVc:MainPageViewController? = nil
    static var mainInstance:MainViewController? = nil
    
    var isFirst = true
    
    func initSetting(){
        children.forEach { (vc) in
            if vc is MainPageViewController{
                pageVc = vc as? MainPageViewController
            }
        }
        pageVc?.mCallback = BasePageCallback(onPage:{ page in self.setTopBar(page)})
        
    }
    
    func displayFault(fault:String){
        
        errorToast(fault)
    }
    
    
    func setTopBar(_ page:Int){
        buttonFeed.isSelected = page == 0
        buttonPencil.isSelected = page == 1
        buttonProfile.isSelected = page == 2
    }
    
    
    @IBAction func onClickFeed(_ sender: Any) {
        pageVc?.goToPage(0)
    }
    
    @IBAction func onClickPencil(_ sender: Any) {
        pageVc?.goToPage(1)
    }
    
    @IBAction func onClickProfile(_ sender: Any) {
        pageVc?.goToPage(2)
    }
    
    deinit{
        print("any thing")
    }
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
    }
    
}
