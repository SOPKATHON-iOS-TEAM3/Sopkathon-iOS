//
//  NicknameViewController.swift
//  Sopkathon-iOS
//
//  Created by 김민서 on 5/18/24.
//

import UIKit

import SnapKit
import Then

final class NicknameViewController: UIViewController {
    
    private let nicknameLabel = UILabel().then {
        $0.text = "닉네임을 입력하세요"
        $0.textColor = .black
        $0.textAlignment = .center
        $0.numberOfLines = 1
        $0.font = .title1
    }
    
    private let nicknameTextField = UITextField().then {
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .gray
    }
    
    private let nextButton = UIButton().then {
        $0.backgroundColor = .gray
        $0.setTitle("다음", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 14)
        $0.layer.cornerRadius = 10
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        setDelegate()
    }
}

private extension NicknameViewController {
    
    func setHierarchy() {
        [nicknameLabel, nicknameTextField, nextButton].forEach { [weak self] view in
            guard let self = self else { return }
            self.view.addSubview(view)
        }
        
    }
    
    func setLayout() {
        self.view.backgroundColor = .white
        
        nicknameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(278)
            $0.leading.trailing.equalToSuperview()
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(25)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(56)
        }
        
        nextButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(84)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(56)
        }
    }
    
    func setDelegate() {
        
    }
}
