//
//  AnswerView.swift
//  Sopkathon-iOS
//
//  Created by 서은수 on 5/19/24.
//

import UIKit

import SnapKit
import Then

class AnswerView: UIView {
    
    var isTop: Bool
        
    let answerLabel = UILabel().then {
        $0.text = "정답을 입력하세요.정답을정답을"
        $0.textColor = .white
        $0.font = .title4_b_18
    }
    
    private lazy var imageView = UIImageView().then {
        $0.image = self.isTop ? .starCharacter : .blueCharacter
    }
    
    init(isTop: Bool) {
        self.isTop = isTop
        super.init(frame: .zero)
        setLayout()
        setStyle()
    }
    
    override init(frame: CGRect) {
        self.isTop = false
        super.init(frame: frame)
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        self.isTop = false
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        addSubviews(answerLabel, imageView)
        
        answerLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(24)
        }
        
        imageView.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setStyle() {
        backgroundColor = .background
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
}
