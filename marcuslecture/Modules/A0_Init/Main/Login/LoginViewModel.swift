//
//  LoginViewModel.swift
//  marcuslecture
//
//  Created by Yunseong Hwang on 2022/09/20.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit


class LoginViewModel {
    
    var disposeBag = DisposeBag();
    let idText : BehaviorRelay<String> = BehaviorRelay(value: "")
    let pwText : BehaviorRelay<String> =
    BehaviorRelay(value: "")
    
    let idValid : BehaviorRelay<Bool> = BehaviorRelay(value: false)
    let pwValid : BehaviorRelay<Bool> =
    BehaviorRelay(value: false)
    let loginBtnEnabled : BehaviorRelay<Bool> = BehaviorRelay(value: false)
    
    init() {
        idText.map(checkEmailValid).bind(to: idValid).disposed(by: disposeBag)
        pwText.map(checkPasswordValid).bind (to: pwValid).disposed(by: disposeBag)
        
        Observable.combineLatest(idValid, pwValid, resultSelector: {$0 && $1}).bind(to: loginBtnEnabled).disposed(by: disposeBag)
    }
    
    private func checkEmailValid(_ email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }
    private func checkPasswordValid(_ password: String) -> Bool {
        return password.count > 6
    }
}
