//
//  ResultQuizViewController.swift
//  Sopkathon-iOS
//
//  Created by 서은수 on 5/19/24.
//

import UIKit

import SnapKit
import Sopkathon_iOS_Extension
import Then

final class ResultQuizViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    private let resultLabel = UILabel().then {
        $0.font = .title1
        $0.text = "둥둥이님의 퀴즈 결과"
        $0.textColor = .black
    }
    
    private let resultCardView = UIView().then {
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 10
    }
    
    private let correctQuizLabel = UILabel().then {
        let str = "3개중\n0개를\n맞추셨어요!"
        $0.font = .systemFont(ofSize: 28)
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.textAlignment = .center
        let attrString = NSMutableAttributedString(string: str)
        attrString.addAttribute(
            .font,
            value: UIFont.systemFont(ofSize: 50),
            range: NSRange.init(location: 3, length: 5)
        )
        $0.attributedText = attrString
    }
    
    private let guideLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .white
        $0.text = "점수를 보여주고 친구와 오늘부터 0일~"
    }
    
    private let shareButton = UIButton().then {
        $0.titleLabel?.textColor = .black
        $0.setTitle("결과 공유하기", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .gray
    }
    
    private let goHomeButton = UIButton().then {
        $0.titleLabel?.textColor = .black
        $0.setTitle("홈으로", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .gray
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setLayout()
    }
    
    
    // MARK: - UI&Layout
    
    private func setLayout() {
        view.addSubviews(
            resultLabel,
            resultCardView,
            shareButton,
            goHomeButton
        )
        
        resultCardView.addSubviews(
            correctQuizLabel,
            guideLabel
        )
        
        resultLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(57)
            $0.centerX.equalToSuperview()
        }
        
        goHomeButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(60)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-18)
        }
        
        shareButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(60)
            $0.bottom.equalTo(goHomeButton.snp.top).offset(-10)
        }
        
        resultCardView.snp.makeConstraints {
            $0.top.equalTo(resultLabel.snp.bottom).offset(57)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalTo(shareButton.snp.top).offset(-44)
        }
        
        correctQuizLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(87)
            $0.centerX.equalToSuperview()
        }
        
        guideLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(45)
            $0.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    

}
