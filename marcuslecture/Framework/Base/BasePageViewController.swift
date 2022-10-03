//
//  BasePageViewController.swift
//  marcuslecture
//
//  Created by Yunseong Hwang on 2022/09/30.
//

import Foundation
import UIKit

public struct BasePageCallback{
    public var onPage:((Int)->())
    public init(onPage: @escaping (Int) -> Void) {
        self.onPage = onPage
    }
}

open class BasePageViewController : UIPageViewController,
                                    UIPageViewControllerDataSource, UIPageViewControllerDelegate{
    
    public var vcList:[UIViewController] = []
    public var mCallback:BasePageCallback? = nil
    public var currentIndex:Int = 0
    
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = vcList.firstIndex(of: viewController as! BaseViewControl) else
        {return nil}
        if index < 1 {
            return nil
        } else {
            return vcList[index - 1]
        }
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let index = vcList.firstIndex(of: viewController as! BaseViewControl) else {return nil}
        
        if index + 1 >= vcList.count{
            return nil
        } else {
            return vcList[index + 1]
        }
    }
    
    required public init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
    }
    
    public func addVC(addList:[UIViewController]){
        
        vcList = addList
        
        if vcList.count > 0{
            
            self.setViewControllers([vcList[0]], direction: .forward, animated: false) { (result) in
                
            }
            
        }
    }
    public func removeSwipeGesture(){
        for view in self.view.subviews {
            if let subView = view as? UIScrollView {
                subView.isScrollEnabled = false
            }
        }
    }
    
    public func setCallback(_ callback:BasePageCallback){
        mCallback = callback
    }
    
    open func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        if let firstViewController = viewControllers?.first, firstViewController is BaseViewControl,
            let index = vcList.firstIndex(of: firstViewController as! BaseViewControl) {
            
            mCallback?.onPage(index)
            
            self.currentIndex = index
        }
    }
    
    open func goToPage(_ index: Int) {
        if index < vcList.count {
            var anim:UIPageViewController.NavigationDirection = .forward
            
            if index == 0{
                anim = .reverse
            }else{
                if let firstViewController = viewControllers?.first, firstViewController is BaseViewControl,
                    let currentIndex = vcList.firstIndex(of: firstViewController as! BaseViewControl) {
                    
                    if index < currentIndex{
                        anim = .reverse
                    }
                    
                }
            }
            
            self.setViewControllers([vcList[index]], direction: anim, animated: false, completion: nil)
            
            self.currentIndex = index
            
            self.mCallback?.onPage(index)
        }
        
    }
    
    public override func setViewControllers(_ viewControllers: [UIViewController]?, direction: UIPageViewController.NavigationDirection, animated: Bool, completion: ((Bool) -> Void)? = nil) {
        super.setViewControllers(viewControllers, direction: direction, animated: animated, completion: completion)
    }
    
    public func previousPage(){
        
        if currentIndex != 0{
            currentIndex -= 1
            goToPage(currentIndex)
            
        }
    }
    
    public func nextPage(){
        if currentIndex < (vcList.count - 1){
            currentIndex += 1
            goToPage(currentIndex)
        }
    }
    
    
}
