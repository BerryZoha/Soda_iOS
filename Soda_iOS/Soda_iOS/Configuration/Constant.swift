//
//  Constant.swift
//  EduTemplate - storyboard
//
//  Created by Zero Yoon on 2022/02/23.
//

import Alamofire

struct Constant {
    //url 주소
    static let BASE_URL = "https://dev.hiberry.shop/"
    
    static var kakao_HEADERS:HTTPHeaders = ["access-token": JwtToken.token!]
    
    static var HEADERS:HTTPHeaders = ["x-access-token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWR4IjoxLCJpYXQiOjE2NDM0NjA3NzYsImV4cCI6MTY0NjA1Mjc3Nn0.pLuAOJ_mCSLx9l1Utclv-WIEuNZTukUnFcq3B7KdcPw"]
}
