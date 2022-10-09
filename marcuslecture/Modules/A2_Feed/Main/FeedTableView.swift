//
//  FeedTableView.swift
//  marcuslecture
//
//  Created by Yunseong Hwang on 2022/10/08.
//

import Foundation
import UIKit
import SnapKit

//struct FeedGalleryModel{
//    var feedImg : String
//    var name: String
//    var feedDate : String
//}
//struct FeedCallback {
//    var onClick : ((FeedGalleryModel) -> ())
//}

class FeedTableView : UITableView, UITableViewDataSource, UITableViewDelegate{
   
    var data:[FeedGalleryModel] = []
    var mFeedCallback: FeedCallback? = nil
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        initSetting()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSetting()
    }
    func updateDelegate() {
        self.delegate = self
        self.dataSource = self
    }
    
    func initSetting(){
        self.dataSource = self
        self.delegate = self
        
        self.register(FeedTableViewCell.self, forCellReuseIdentifier: FeedTableViewCell.identifier)

        if #available(iOS 15.0, *) {
            //self.sectionHeaderTopPadding = 0
        }
        
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.identifier, for: indexPath) as! FeedTableViewCell
        cell.initSetting(item: item, callback: mFeedCallback)
        return cell
    }
    
    func addData(data:[FeedGalleryModel]){
        self.data.removeAll()
        self.data = data
        reloadData()
    }
    
}

class FeedTableViewCell : UITableViewCell{
    var mCallback : FeedCallback? = nil
    var mItem : FeedGalleryModel? = nil
    
    static let identifier = "FeedTableViewCell"
    
    let img : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "icon")
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let label : UILabel = {
        let label = UILabel()
        label.text = "PicName"
        label.textColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    func initSetting(item : FeedGalleryModel, callback: FeedCallback?){
        mItem = item
        mCallback = callback
        label.text = item.name
        addContentView()
        autoLayout()
        
//        buttonCell.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(longClick)))
    }
    
    private func addContentView(){
        self.contentView.addSubview(img)
        self.contentView.addSubview(label)
    }
    
    private func autoLayout(){
        
        img.snp.makeConstraints { make in
            make.leading.top.equalTo(10)
            make.top.equalTo(self.contentView.snp.top).inset(10)
            make.size.width.height.equalTo(80)
        }
        label.snp.makeConstraints { make in
            make.leading.equalTo(img.snp.trailing).offset(5)
            make.top.equalTo(10)
            make.trailing.equalTo(10)
        }
        
    }
    

}
