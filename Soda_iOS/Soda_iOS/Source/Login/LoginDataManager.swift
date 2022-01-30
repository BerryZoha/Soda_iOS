//
//  HomeDataManager.swift
//  Tipkle
//
//  Created by 이유리 on 2021/12/03.
//

import Alamofire
import Foundation

class LoginDataManager {
    func postKakaoLogin(viewController: LoginViewController) {
        AF.request("\(Constant.BASE_URL)auth/kakao", method: .post, parameters: nil, encoding: JSONEncoding.default, headers: Constant.kakao_HEADERS)
            .validate()
            .responseDecodable(of: KakaoLoginResponse.self) { response in
                switch response.result {
                case .success(let response):
                    viewController.didSuccessKakaoLogin(response.result)
                case .failure(let error):
                    print(error)
                    viewController.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}

