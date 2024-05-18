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
        
    private let answerLabel = UILabel().then {
        $0.text = "정답을 입력하세요.정답을정답을"
        $0.font = .systemFont(ofSize: 18)
    }
    
    private let imageView = UIImageView().then {
        $0.image = .dummy
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
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
        backgroundColor = .red
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
}
