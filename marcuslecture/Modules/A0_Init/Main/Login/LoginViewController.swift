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
//        self.bind(viewModel: self.viewModel)
        // Do any additional setup after loading the view.
    }
    
    private func bindInput(){
        idField.rx.text.orEmpty.bind(to: viewModel.idText).disposed(by: disposeBag)
        passwordField.rx.text.orEmpty.bind(to: viewModel.pwText).disposed(by: disposeBag)
    }
    private func subscribe(){
        viewModel.idValid.subscribe(onNext: {b in print("아이디가 적합합니다.")}).disposed(by: disposeBag)
        viewModel.pwValid.subscribe(onNext: {b in print("패스워드가 적합합니다.")}).disposed(by: disposeBag)
    }
}
