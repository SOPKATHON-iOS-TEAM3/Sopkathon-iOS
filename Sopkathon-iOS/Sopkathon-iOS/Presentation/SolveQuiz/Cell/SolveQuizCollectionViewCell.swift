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
    
    var isFirstAnswerChecked: Bool = false
    var isSecondAnswerChecked: Bool = false
    var delegate: NextButtonProtocol?
    
    // MARK: - UI Components
    
    private let questionLabel = UILabel().then {
        $0.font = .title1_b_28
        $0.text = "내가 좋아하는 색깔은?"
        $0.textColor = .white
    }
    
    private lazy var firstAnswerView = AnswerView(isTop: true)
        .then {
            let tap = UITapGestureRecognizer(target: self, 
                                             action: #selector(answerViewDidTap(_:)))
            $0.addGestureRecognizer(tap)
        }
    private lazy var secondAnswerView = AnswerView()
        .then {
            let tap = UITapGestureRecognizer(target: self,
                                             action: #selector(answerViewDidTap(_:)))
            $0.addGestureRecognizer(tap)
        }
    
    private lazy var nextButton = CustomButton(title: "다음")
        .setColor(bgColor: UIColor.background, disableColor: UIColor.gray13)
        .then {
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
    
    @objc
    func answerViewDidTap(_ sender: UIView) {
        guard let sender = sender as? AnswerView else { return }
//        if sender.isTop {
//            isFirstAnswerChecked.toggle()
//            firstAnswerView.layer.borderColor = isFirstAnswerChecked ? UIColor.white.cgColor : nil
//            firstAnswerView.layer.borderWidth = isFirstAnswerChecked ? 1.0 : 0.0
//        } else {
//            isSecondAnswerChecked.toggle()
//            secondAnswerView.layer.borderColor = isSecondAnswerChecked ? UIColor.white.cgColor : nil
//            secondAnswerView.layer.borderWidth = isSecondAnswerChecked ? 1.0 : 0.0
//        }
    }
}
