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
        $0.font = .title1_b_28
        $0.text = "둥둥이님의 퀴즈 결과"
        $0.textColor = .white
    }
    
    private let resultCardView = UIImageView().then {
        $0.image = .card
        $0.layer.cornerRadius = 10
    }
    
    private let correctQuizLabel = UILabel().then {
        let str = "3개중\n0개를\n맞추셨어요!"
        $0.font = .title1_b_28
        $0.textColor = .white
        $0.numberOfLines = 0
        let attrString = NSMutableAttributedString(string: str)
        attrString.addAttribute(
            .font,
            value: UIFont.body9_b_50,
            range: NSRange.init(location: 3, length: 5)
        )
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 20
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        $0.attributedText = attrString
        $0.textAlignment = .center
    }
    
    private let guideLabel = UILabel().then {
        $0.font = .body10_sb_16
        $0.textColor = .white
        $0.text = "결과를 공유하고 친구와 오늘부터 1일~"
    }
    
    private lazy var shareButton = CustomButton(title: "결과 공유하기")
        .setColor(bgColor: .mainPink, disableColor: .mainPink)
        .then {
            $0.addTarget(self, action: #selector(shareButtonDidTap), for: .touchUpInside)
        }
    
    private lazy var goHomeButton = CustomButton(title: "홈으로")
        .setColor(bgColor: .subBlue, disableColor: .mainPink)
        .then {
            $0.addTarget(self, action: #selector(goHomeButtonDidTap), for: .touchUpInside)
        }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        
        setLayout()
    }
    
    
    // MARK: - UI&Layout
    
    private func setLayout() {
        view.addSubviews(
            resultCardView,
            shareButton,
            goHomeButton
        )
        
        resultCardView.addSubviews(
            resultLabel,
            correctQuizLabel,
            guideLabel
        )
        
        resultLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(38)
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
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(52)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalTo(shareButton.snp.top).offset(-44)
        }
        
        correctQuizLabel.snp.makeConstraints {
            $0.top.equalTo(resultLabel.snp.bottom).offset(100)
            $0.centerX.equalToSuperview()
        }
        
        guideLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(45)
            $0.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    @objc
    private func shareButtonDidTap(_ sender: Any) {
        guard let image = resultCardView.transfromToImage() else {
            return
        }
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        present(vc, animated: true)
    }
    
    @objc
    private func goHomeButtonDidTap(_ sender: Any) {
        UIView.animate(withDuration: 0.4) {
            self.navigationController?.viewControllers = [HomeViewController()]
        }
    }
}
