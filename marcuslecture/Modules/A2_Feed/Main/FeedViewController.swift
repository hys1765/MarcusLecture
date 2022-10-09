//
//  FeedViewController.swift
//  marcuslecture
//
//  Created by Yunseong Hwang on 2022/10/03.
//

import Foundation
import UIKit

class FeedViewController : BaseViewControl{
    
    var dummyData : [FeedGalleryModel] = [
        FeedGalleryModel(feedImg: "Image1",name: "1",feedDate: "121212"),
        FeedGalleryModel(feedImg: "Image1",name: "2",feedDate: "121212"),
        FeedGalleryModel(feedImg: "Image1",name: "2",feedDate: "121212"),
        FeedGalleryModel(feedImg: "Image1",name: "2",feedDate: "121212"),
        FeedGalleryModel(feedImg: "Image2",name: "2",feedDate: "121212"),
        FeedGalleryModel(feedImg: "Image1",name: "2",feedDate: "121212"),
        FeedGalleryModel(feedImg: "Image2",name: "2",feedDate: "121212"),
        FeedGalleryModel(feedImg: "Image1",name: "2",feedDate: "121212"),
        FeedGalleryModel(feedImg: "Image2",name: "2",feedDate: "121212"),
        FeedGalleryModel(feedImg: "Image1",name: "2",feedDate: "121212"),
        FeedGalleryModel(feedImg: "Image1",name: "2",feedDate: "121212"),
        FeedGalleryModel(feedImg: "Image2",name: "2",feedDate: "121212"),
        FeedGalleryModel(feedImg: "Image1",name: "2",feedDate: "121212"),
        FeedGalleryModel(feedImg: "Image2",name: "2",feedDate: "121212"),
        FeedGalleryModel(feedImg: "Image1",name: "2",feedDate: "121212"),
        FeedGalleryModel(feedImg: "Image2",name: "2",feedDate: "121212"),
        FeedGalleryModel(feedImg: "Image1",name: "2",feedDate: "121212"),
        FeedGalleryModel(feedImg: "Image2",name: "2",feedDate: "121212"),
        FeedGalleryModel(feedImg: "Image1",name: "2",feedDate: "121212"),
        FeedGalleryModel(feedImg: "Image2",name: "2",feedDate: "121212"),
        FeedGalleryModel(feedImg: "Image2",name: "2",feedDate: "121212"),
        FeedGalleryModel(feedImg: "Image2",name: "2",feedDate: "121212"),
    ]
    
    
//    private let mFeedTableView : FeedTableView = {
//        let tableView = FeedTableView()
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier:FeedTableViewCell.identifier)
//        return tableView
//    }()
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
            setup()
    }

    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
            setup()
    }
    private func setup(){
      
    }
    
    @IBOutlet weak var mFeedView: FeedCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initSetting()
        mFeedView.addData(data: dummyData)
//        mTableViewFeed.addList(dummyData, page: 1)
//        mTableViewFeed.reloadData()
    }
    

    
    private func initSetting(){
        var layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1
        layout.scrollDirection = .vertical
        layout.sectionInset = .zero
        mFeedView.collectionViewLayout = layout
//        mFeedView.scrollDirection = .vertical
//        mFeedView.sectionInset = .vertica

    }
    

}
