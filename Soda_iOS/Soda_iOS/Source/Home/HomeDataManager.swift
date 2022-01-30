//
//  HomeDataManager.swift
//  Soda_iOS
//
//  Created by 이유리 on 2022/01/30.
//

import Foundation
import Alamofire

class HomeDataManager {
    func getCategory(search: String, viewController: HomeViewController) {
        let url = "\(Constant.BASE_URL)categories"
        + "?search=\(search)"
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: Constant.HEADERS)
            .validate()
            .responseDecodable(of: GetCategoryResponse.self) { response in
                switch response.result {
                case .success(let response):
                    viewController.didSuccessGetCategory(response.result)
                case .failure(let error):
                    print(error)
                    viewController.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
