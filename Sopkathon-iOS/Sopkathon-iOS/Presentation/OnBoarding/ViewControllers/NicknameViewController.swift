//
//  NicknameViewController.swift
//  Sopkathon-iOS
//
//  Created by 김민서 on 5/18/24.
//

import UIKit

import SnapKit
import Sopkathon_iOS_Extension
import Then

final class NicknameViewController: UIViewController {

    private let characterImageView = UIImageView().then {
        $0.image = .imgOnboarding
    }
    
    private let nicknameLabel = UILabel().then {
        $0.text = "닉네임을 입력하세요"
        $0.textColor = .white
        $0.textAlignment = .center
        $0.numberOfLines = 1
        $0.font = .title1_b_28
    }
    
    private let nicknameTextField = UITextField().then {
        $0.font = .body3_sb_22
        $0.backgroundColor = UIColor.gray03
        $0.textAlignment = .center
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray06.cgColor
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray08,
            .font: UIFont.body3_sb_22
        ]
        let attributedPlaceholder = NSAttributedString(string: "ex. 동글이(최대 5글자)", attributes: attributes)
        $0.attributedPlaceholder = attributedPlaceholder
    }
    
    private lazy var nextButton = CustomButton(title: "다음")
      .setColor(bgColor: .subBlue, disableColor: .gray08)
      .setEnabled(false).then {
          $0.addTarget(self, action: #selector(nextButtonClicked), for: .touchUpInside)
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
        view.addSubviews(characterImageView,nicknameLabel, nicknameTextField, nextButton)
    }
    
    func setLayout() {
        self.view.backgroundColor = .background
        
        nicknameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(278)
            $0.leading.trailing.equalToSuperview()
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(25)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
        
        characterImageView.snp.makeConstraints {
            $0.top.equalTo(nicknameTextField.snp.bottom).offset(92)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(296)
            $0.height.equalTo(123)
        }
        
        nextButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(84)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
    }
    
    func setDelegate() {
        nicknameTextField.delegate = self
    }
    
    /// 화면 전환
    @objc func nextButtonClicked() {
        pushToNumOfFriendsVC()
    }
    
    private func pushToNumOfFriendsVC() {
        let numOfFriendsViewController = NumOfFriendsViewController()
        self.navigationController?.pushViewController(numOfFriendsViewController, animated: true)
    }
    
}

extension NicknameViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        updateButtonState(for: textField.text ?? "")
    }
    
    private func updateButtonState(for text: String) {
        let isNicknameValid = text.count >= 2 && text.count <= 5
        print(isNicknameValid)
        nextButton.setEnabled(isNicknameValid)
    }
}


