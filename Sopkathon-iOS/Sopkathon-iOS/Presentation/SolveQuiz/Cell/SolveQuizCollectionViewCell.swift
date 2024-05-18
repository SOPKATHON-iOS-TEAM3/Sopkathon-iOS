//
//  SolveQuizCollectionViewCell.swift
//  Sopkathon-iOS
//
//  Created by 서은수 on 5/19/24.
//

import UIKit

import SnapKit
import Sopkathon_iOS_Extension
import Then

class SolveQuizCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var delegate: NextButtonProtocol?
    
    // MARK: - UI Components
    
    private let questionLabel = UILabel().then {
        $0.font = .title1
        $0.text = "내가 좋아하는 색깔은?"
        $0.textColor = .black
    }
    
    private let firstAnswerView = AnswerView()
    private let secondAnswerView = AnswerView()
    
    private lazy var nextButton = CustomButton(title: "다음").then {
        $0.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    
    // MARK: - UI&Layout
    
    private func setLayout() {
        addSubviews(questionLabel, firstAnswerView, secondAnswerView, nextButton)
        
        questionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(157)
            $0.centerX.equalToSuperview()
        }
        firstAnswerView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(questionLabel.snp.bottom).offset(86)
            $0.height.equalTo(140)
        }
        secondAnswerView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(firstAnswerView.snp.bottom).offset(18)
            $0.height.equalTo(140)
        }
        nextButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(52)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
    }
    
    // MARK: - Methods
    
    @objc
    func nextButtonDidTap() {
        delegate?.pagingToNextQuestion()
    }
}
