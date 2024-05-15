//
//  FontLiterals.swift
//  Sopkathon-iOS
//
//  Created by 이명진 on 5/16/24.
//

import UIKit

extension UIFont {
    // 예시 코드 입니다.
    @nonobjc class var title1: UIFont {
        return UIFont.font(.pretendardBold, ofSize: 30)
    }
}

enum FontName: String {
    case pretendardBold = "Pretendard-Bold"
    case pretendardExtraBold = "Pretendard-ExtraBold"
    case pretendardLight = "Pretendard-Light"
    case pretendardMedium = "Pretendard-Medium"
    case pretendardRegular = "Pretendard-Regular"
    case pretendardSemiBold = "Pretendard-SemiBold"
}

extension UIFont {
    static func font(_ style: FontName, ofSize size: CGFloat) -> UIFont {
        guard let customFont = UIFont(name: style.rawValue, size: size) else {
            print("🍎 Failed to load the \(style.rawValue) font ! 🍎")
            print("🍎 기본 폰트 출력 ! 🍎")
            return UIFont.systemFont(ofSize: size)
        }
        return customFont
    }
}

