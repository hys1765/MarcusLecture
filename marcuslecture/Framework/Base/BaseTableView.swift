//
//  BaseTableView.swift
//  marcuslecture
//
//  Created by Yunseong Hwang on 2022/10/08.
//

import Foundation
import UIKit

public struct BaseTableCallback<T> {
    public var onClick:((T) -> ())?
    public var onPaging:(() -> ())?
}

open class BaseTableView<T> : UITableView, UITableViewDataSource,
UITableViewDelegate{
    
    
    var isPageUse = true
    public var data:[T] = []
    public var mCallback : BaseTableCallback<T>? = nil
    
    override public init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        initSetting()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        initSetting()
    }
    
    func initSetting(){
//        DispatchQueue.main.async {
            self.delegate = self
            self.dataSource = self
            
            if #available(iOS 15.0, *) {
                //self.sectionHeaderTopPadding = 0
            }
            
            
//        }
    }
    
    open func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return 1
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cnt = data.count
        return cnt
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
//    open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return UITableViewCell()
//    }
    
//    open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//
//    open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return CGFloat.leastNormalMagnitude
//    }
    
    
    public func addList(_ list:[T], page:Int){
//        if page == 1{
//            data.removeAll()
//        }
        if list.count > 0 {
            isPageUse = true
        }
        
        data += list
        reloadData()
    }
    
    public func setList(_ list:[T]){
        data = list
        reloadData()
    }
    
//    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if(isPageUse){
//            let height = scrollView.frame.size.height
//            let contentYoffset = scrollView.contentOffset.y
//            let distanceFromBottom = scrollView.contentSize.height - contentYoffset
//            if distanceFromBottom < height {
//                if self.mCallback != nil{
//                    isPageUse = false
//                    mCallback?.onPaging?()
//                }
//            }
//        }
//    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = data[indexPath.row]
        mCallback?.onClick?(item)
    }
    
}
