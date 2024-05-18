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

    private let nicknameLabel = UILabel().then {
        $0.text = "닉네임을 입력하세요"
        $0.textColor = .white
        $0.textAlignment = .center
        $0.numberOfLines = 1
        $0.font = UIFont(name: "Arita4.0_SB", size: 28)
    }
    
    private let nicknameTextField = UITextField().then {
        $0.font = .title1
        $0.backgroundColor = UIColor.gray03
        $0.textAlignment = .center
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray06.cgColor
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray08,
            .font: UIFont.title1
        ]
        let attributedPlaceholder = NSAttributedString(string: "ex. 동글이(최대 5글자)", attributes: attributes)
        $0.attributedPlaceholder = attributedPlaceholder
    }
    
    private lazy var nextButton = CustomButton(title: "다음")
      .setColor(bgColor: .mainPink, disableColor: .gray08)
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
        view.addSubviews(nicknameLabel, nicknameTextField, nextButton)
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
        
        nextButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(84)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(56)
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


