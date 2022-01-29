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
                        self.acceessToken = oauthToken?.accessToken

                        let mainTabBarController = UIStoryboard(name: "HomeStoryboard", bundle: nil).instantiateViewController(identifier: "MainTabBarController")
                        self.changeRootViewController(mainTabBarController)
    
                    }
                }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
