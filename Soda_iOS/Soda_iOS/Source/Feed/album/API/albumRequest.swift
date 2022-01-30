//
//  albumRequest.swift
//  Soda_iOS
//
//  Created by 안현정 on 2022/01/30.
//

import Foundation

import Alamofire
import UIKit

class albumRequest {
    
    func albumData(Idx: Int, Type : String, _ viewController: AlbumViewController) {
        let url = "https://dev.hiberry.shop/diaries?categoryIdx=\(Idx)&search=&type=\(Type)"
        
            AF.request(url,
                       method: .get,
                       parameters: nil,
                       encoding: URLEncoding.default,
                       headers: ["X-ACCESS-TOKEN": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWR4IjoxLCJpYXQiOjE2NDM0NjA3NzYsImV4cCI6MTY0NjA1Mjc3Nn0.pLuAOJ_mCSLx9l1Utclv-WIEuNZTukUnFcq3B7KdcPw" ])
                .validate()
                .responseDecodable(of: albumResponse.self) { response in
                        
                switch response.result {
                case .success(let response):
                    print("DEBUG>> Success \(response) ")
                    
                    
                    viewController.successData(response)
                     //ProductDataModel.favoriteCount = response.result.cntLikes ?? 0
                  print("성공")
                    
                    
                case .failure(let error):
                    print("DEBUG>> Error : \(error)")
                }
            }
        }

    }



