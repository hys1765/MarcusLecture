//
//  LoginViewController.swift
//  marcuslecture
//
//  Created by Yunseong Hwang on 2022/09/18.
//

import UIKit
import RxSwift

class LoginViewController: UIViewController {
    
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
        
    @IBOutlet weak var loginBtn: UIButton!
    
    
    let viewModel = LoginViewModel()
    var disposeBag = DisposeBag()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        bindInput()
        subscribe()
    }
    
    @IBAction func onClickLoginPass(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.switchMain()
    }
    
    private func bindInput(){
        idField.rx.text.orEmpty.bind(to: viewModel.idText).disposed(by: disposeBag)
        passwordField.rx.text.orEmpty.bind(to: viewModel.pwText).disposed(by: disposeBag)
    }
    private func subscribe(){
        viewModel.idValid.subscribe(onNext: {b in}).disposed(by: disposeBag)
        viewModel.pwValid.subscribe(onNext: {b in }).disposed(by: disposeBag)
        viewModel.loginBtnEnabled.subscribe(onNext: {b in self.loginBtn.isEnabled = b}).disposed(by: disposeBag)
    }
}
