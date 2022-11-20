//
//  SearchWebViewController.swift
//  marcuslecture
//
//  Created by Yunseong Hwang on 2022/11/20.
//

import Foundation
import UIKit
import WebKit

class SearchWebViewController : UIViewController{
    
    @IBOutlet weak var mWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = (URL(string: "https://www.naver.com") ?? nil)!
        let request = URLRequest(url: url)
        mWebView.configuration.preferences.javaScriptEnabled
        mWebView.load(request)
    }
}

extension SearchWebViewController : WKUIDelegate, WKNavigationDelegate{
    override func loadView() {
        super.loadView()
        mWebView = WKWebView(frame: self.view.frame)
        mWebView.uiDelegate = self
        mWebView.navigationDelegate = self
        self.view = self.mWebView
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
//        alertController.addAction(UIAlertAction(title: "확인", style: .default, handler: { action in
//            completionHandler(false)
//        }))
        alertController.addAction(UIAlertAction(title: "취소", style: .default, handler: {action in completionHandler()}))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "취소", style: .default, handler: { (action) in completionHandler(false) }))
        alertController.addAction(UIAlertAction(title: "확인", style: .default, handler: { (action) in completionHandler(true) }))
                self.present(alertController, animated: true, completion: nil)
    }
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
           if navigationAction.targetFrame == nil { webView.load(navigationAction.request) }
           return nil
    }
}






