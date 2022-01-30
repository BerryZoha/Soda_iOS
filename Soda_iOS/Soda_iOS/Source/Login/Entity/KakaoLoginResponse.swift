//
//  KakaoLoginResponse.swift
//  Soda_iOS
//
//  Created by 이유리 on 2022/01/30.
//

struct KakaoLoginResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: KakaoLoginResult
}

struct KakaoLoginResult: Decodable {
    var jwt:String
}
