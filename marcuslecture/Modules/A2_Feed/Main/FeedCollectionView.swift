//
//  FeedCollectionView.swift
//  marcuslecture
//
//  Created by Yunseong Hwang on 2022/10/09.
//

import Foundation
import UIKit

struct FeedGalleryModel{
    var feedImg : String
    var name: String
    var feedDate : String
}

struct FeedCallback {
    var onClick : ((FeedGalleryModel) -> ())
}

class FeedCollectionView : UICollectionView,UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
     var data:[FeedGalleryModel] = []
     var mFeedCallback: FeedCallback? = nil
    
    let sectionInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSetting()
    }
    
    func initSetting(){
        self.delegate = self
        self.dataSource = self
        
        self.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: FeedCollectionViewCell.identifier)

        if #available(iOS 15.0, *) {
            //self.sectionHeaderTopPadding = 0
        }
    }
    
    func addData(data:[FeedGalleryModel]){
        self.data.removeAll()
        self.data = data
        reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewCell.identifier, for: indexPath) as! FeedCollectionViewCell
        cell.initSetting(item: data[indexPath.row], callback: mFeedCallback)
//        cell.img.image = UIImage(named: data[indexPath.row]) ?? UIImage()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width  = (self.frame.width-20)/3
        let width = collectionView.bounds.width
        let height = collectionView.bounds.height
        
        let itemsPerRow : CGFloat = 3
        var itemsPerColumn: CGFloat = 5

        let cellWidth = width / itemsPerRow
        let cellHeight = height / itemsPerColumn
        
        return CGSize(width: cellWidth - 7, height: cellHeight - 10)
    }
}


class FeedCollectionViewCell : UICollectionViewCell{
    var mCallback : FeedCallback? = nil
    var mItem : FeedGalleryModel? = nil
    
    static let identifier = "FeedCollectionViewCell"

    
    let img : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "icon")
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    
    func initSetting(item : FeedGalleryModel, callback: FeedCallback?){
        mItem = item
        mCallback = callback
        addContentView()
        autoLayout()
        img.image = UIImage(named: item.feedImg) ?? UIImage()
    }
    
    private func addContentView(){
        self.contentView.addSubview(img)
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
    }
    
    private func autoLayout(){
        img.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}


