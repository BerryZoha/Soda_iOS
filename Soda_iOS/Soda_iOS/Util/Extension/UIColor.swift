//
//  UIColor.swift
//  EduTemplate - storyboard
//
//  Created by Zero Yoon on 2022/02/23.
//

import UIKit

extension UIColor {
    // MARK: hex code를 이용하여 정의
    // ex. UIColor(hex: 0xF5663F)
    convenience init(hex: UInt, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    
    // MARK: 메인 테마 색 또는 자주 쓰는 색을 정의
    // ex. label.textColor = .mainOrange
    class var mainOrange: UIColor { UIColor(hex: 0xF5663F) }
    class var mint: UIColor { UIColor(hex: 0x15cdca) }
    class var sub_mint: UIColor { UIColor(hex: 0xafe0df) }
    class var gray: UIColor { UIColor(hex: 0xf3f3f3) }
}
