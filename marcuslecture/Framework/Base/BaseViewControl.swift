//
//  BaseViewControl.swift
//  marcuslecture
//
//  Created by Yunseong Hwang on 2022/09/30.
//

import UIKit

class BaseViewControl: UIViewController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 다크모드 무시
        if #available(iOS 13.0, *) {
            // Always adopt a light interface style.
            overrideUserInterfaceStyle = .light
        }
        
        // 네비게이션 왼쪽에서 우측으로 스크롤 허용
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        self.settingKeyboardScroll()
    }
    
    var darkMode = false
    // 스크롤바 사용 변수
    var scrollViewKeyboardMain:UIScrollView?
    
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    override public var preferredStatusBarStyle : UIStatusBarStyle {
        return darkMode ?  .lightContent: .default
    }
   
}

extension BaseViewControl{
    public func setNavCloseEnabled(isEnabled:Bool){
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = isEnabled
    }
}

extension BaseViewControl{
    
    public func setStatusBarDark(){
        self.darkMode = true
        setNeedsStatusBarAppearanceUpdate()
    }
    
    public func setStatusBarLigth(){
        self.darkMode = false
        setNeedsStatusBarAppearanceUpdate()
    }
}


// MARK:스크롤바 관련 함수
extension BaseViewControl: UIScrollViewDelegate{
    
    func settingKeyboardScroll(){
        
        var isDuplicate = false
        
        var scrollView:UIScrollView? = nil
        
        self.view.subviews.forEach { (view) in
            
            if view is UIScrollView{
                
                if scrollView != nil{
                    isDuplicate = true
                }else{
                    scrollView = view as? UIScrollView
                }
                
            }
            
        }
        
        
        if let scView = scrollView, !isDuplicate{ enableKeyboardScrollWhenEditing(scrollViewKeyboardMain: scView)
            
//            scView.delegate = self
               

            
        }
        
    }
    
    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
         self.view.endEditing(true)
    }
    
    @objc func MyTapMethod(sender: UITapGestureRecognizer) {
            self.view.endEditing(true)
        }

    
    
    public func enableKeyboardScrollWhenEditing(scrollViewKeyboardMain:UIScrollView) {
        
        let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MyTapMethod))
                       singleTapGestureRecognizer.numberOfTapsRequired = 1
                       singleTapGestureRecognizer.isEnabled = true
                       singleTapGestureRecognizer.cancelsTouchesInView = false
                       scrollViewKeyboardMain.addGestureRecognizer(singleTapGestureRecognizer)
        
        self.scrollViewKeyboardMain = scrollViewKeyboardMain;
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIWindow.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIWindow.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func keyboardWillShow(_ notification:NSNotification){
        //give room at the bottom of the scroll view, so it doesn't cover up anything the user needs to tap
        let userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        if let svMain = self.scrollViewKeyboardMain {
            var contentInset:UIEdgeInsets = svMain.contentInset
            contentInset.bottom = keyboardFrame.size.height + 40
            svMain.contentInset = contentInset
        }
        
    }
    
    @objc func keyboardWillHide(_ notification:NSNotification){
        if let svMain = self.scrollViewKeyboardMain {
            let contentInset:UIEdgeInsets = UIEdgeInsets.zero
            svMain.contentInset = contentInset
        }
        
    }
}

// MARK:토스트 관련 함수
extension BaseViewControl{
    
    
    public func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    
    public func errorToast(_ fault : String){
        MarcusUtils.Toast.show(message: fault, title: "", color: .red)
    }
    
}




