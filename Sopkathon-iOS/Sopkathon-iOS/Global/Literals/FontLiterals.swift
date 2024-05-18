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
    
    @nonobjc class var title1_b_28: UIFont {
        return UIFont.font(.aritaBold, ofSize: 28)
    }
    
    @nonobjc class var title1_b_16: UIFont {
        return UIFont.font(.pretendardBold, ofSize: 16)
    }
    
    @nonobjc class var body1_sb_22: UIFont {
        return UIFont.font(.aritaSemiBold, ofSize: 22)
    }
}

enum FontName: String {
    case pretendardBold = "Pretendard-Bold"
    case pretendardExtraBold = "Pretendard-ExtraBold"
    case pretendardLight = "Pretendard-Light"
    case pretendardMedium = "Pretendard-Medium"
    case pretendardRegular = "Pretendard-Regular"
    case pretendardSemiBold = "Pretendard-SemiBold"
    
    case aritaBold = "Arita4.0_B"
    case aritaLight = "Arita4.0_L"
    case aritaMedium = "Arita4.0_M"
    case aritaSemiBold = "Arita4.0_SB"
    case aritaThin = "Arita4.0_T"
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

