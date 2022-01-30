//
//  albumResponse.swift
//  Soda_iOS
//
//  Created by 안현정 on 2022/01/30.
//

import Foundation

// MARK: - Welcome
struct albumResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: Result2
}

// MARK: - Result
struct Result2: Codable {
    let categoryName: String
    let diaries: [Diary2]
}

// MARK: - Diary
struct Diary2: Codable {
    let diaryIdx: Int
    let mainImageUrl: String
    let emotion: String

}
