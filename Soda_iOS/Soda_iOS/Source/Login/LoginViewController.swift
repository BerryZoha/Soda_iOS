//
//  LoginViewController.swift
//  Soda_iOS
//
//  Created by 이유리 on 2022/01/29.
//

import UIKit
import KakaoSDKUser
import KakaoSDKAuth
import KakaoSDKUser

class LoginViewController: UIViewController {
    lazy var dataManager = LoginDataManager()
    var acceessToken:String?=nil //property

    @IBAction func tapbtnKakao(_ sender: Any) {
        //카카오톡 설치여부 확인 -> 카카오로 로그인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk { [self](oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    //do something
                    self.acceessToken = oauthToken?.accessToken
                }
            }
        }
        //설치가 안되어있으면 -> 카카오 계정으로 로그인
        else{
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                    if let error = error {
                        print(error)
                    }
                    else {
                        print("loginWithKakaoAccount() success.")

                        //do something
                        UserDefaults.standard.set(oauthToken?.accessToken, forKey: "jwt")
                        print(oauthToken?.accessToken)
                        self.showIndicator()
                        self.dataManager.postKakaoLogin(viewController: self)
    
                    }
                }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 자동로그인
        if (UserDefaults.standard.string(forKey: "jwt") != nil){
            let mainTabBarController = UIStoryboard(name: "HomeStoryboard", bundle: nil).instantiateViewController(identifier: "MainTabBarController")
            self.changeRootViewController(mainTabBarController)
        }
    }
}

extension LoginViewController {
    func didSuccessKakaoLogin(_ result: KakaoLoginResult) {
        UserDefaults.standard.set(result.jwt, forKey: "jwt")
        JwtToken.token = result.jwt
        
        let mainTabBarController = UIStoryboard(name: "HomeStoryboard", bundle: nil).instantiateViewController(identifier: "MainTabBarController")
        self.changeRootViewController(mainTabBarController)
    }
    
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
