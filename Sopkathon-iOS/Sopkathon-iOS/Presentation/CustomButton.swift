//
//  CustomButton.swift
//  Sopkathon-iOS
//
//  Created by 이명진 on 5/19/24.
//

import UIKit

import Sopkathon_iOS_Extension

public class CustomButton: UIButton {
    
    // MARK: - Initialize
    
    public init(title: String) {
        super.init(frame: .zero)
        self.setUI(title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods

extension CustomButton {
    /// 버튼의 enable 여부 설정
    @discardableResult
    public func setEnabled(_ isEnabled: Bool) -> Self {
        self.isEnabled = isEnabled
        return self
    }
    
    /// 버튼의 Title 변경
    @discardableResult
    public func changeTitle(attributedString: NSAttributedString) -> Self {
        self.setAttributedTitle(attributedString, for: .normal)
        return self
    }
    
    @discardableResult
    public func setTitle(title: String) -> Self {
        self.setAttributedTitle(
            NSAttributedString(
                string: title,
                attributes: [.font: UIFont.title2_b_16, .foregroundColor: UIColor.white]
            ),
            for: .normal
        )
        return self
    }
    
    /// 버튼의 backgroundColor, textColor 변경
    @discardableResult
    public func setColor(bgColor: UIColor, disableColor: UIColor, textColor: UIColor = .white) -> Self {
        self.setBackgroundColor(bgColor, for: .normal)
        self.setBackgroundColor(disableColor, for: .disabled)
        self.setAttributedTitle(
            NSAttributedString(
                string: self.titleLabel?.text ?? "",
                attributes: [.font: UIFont.title2_b_16, .foregroundColor: textColor]),
            for: .normal)
        
        return self
    }
}

// MARK: - UI & Layout

extension CustomButton {
    private func setUI(_ title: String) {
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        
        self.setBackgroundColor(.gray08, for: .normal)
        self.setBackgroundColor(.zeroPink, for: .disabled)
        self.setAttributedTitle(
            NSAttributedString(
                string: title,
                attributes: [.font: UIFont.title2_b_16, .foregroundColor: UIColor.white]
            ),
            for: .normal
        )
    }
}
