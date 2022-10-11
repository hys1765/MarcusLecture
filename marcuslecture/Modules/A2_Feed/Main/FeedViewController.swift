//
//  FeedViewController.swift
//  marcuslecture
//
//  Created by Yunseong Hwang on 2022/10/03.
//

import Foundation
import UIKit

class FeedViewController : BaseViewControl{
    
    let viewModel = FeedViewModel()
    var mItem : FeedGalleryModel?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?){
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
            setup()
    }

    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
            setup()
    }
    private func setup(){
      
    }
    
    @IBOutlet weak var mFeedView: FeedCollectionView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "FeedDetailSegue"{
//            let selector = NSSelectorFromString("")
            let vc = segue.destination as! FeedDetailViewController
            vc.mFeed = mItem ?? FeedGalleryModel(feedImg: "", name: "", feedDate: "")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initSetting()
        
        mFeedView.addData(data: viewModel.dummyData)
//        mTableViewFeed.addList(dummyData, page: 1)
//        mTableViewFeed.reloadData()
    }

    
    private func initSetting(){
        var layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1
        layout.scrollDirection = .vertical
        layout.sectionInset = .zero
        mFeedView.collectionViewLayout = layout
        mFeedView.mFeedCallback = FeedCallback(
            onClick: { mItem in
            self.mItem = mItem
            print("mItem : \(mItem)")
//            let vc = FeedDetailViewController(feed: mItem)
//            self.navigationController?.pushViewController(vc, animated: true)
            self.performSegue(withIdentifier: "FeedDetailSegue", sender: nil)
            
        })
    }
    

}
