//
//  GetCategoryResponse.swift
//  Soda_iOS
//
//  Created by 이유리 on 2022/01/30.
//

struct GetCategoryResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [GetCategoryResult]
}

struct GetCategoryResult: Decodable {
    var categoryIdx: Int
    var name: String
}
