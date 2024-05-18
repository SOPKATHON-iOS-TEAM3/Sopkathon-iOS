//
//  NumOfFriendsViewController.swift
//  Sopkathon-iOS
//
//  Created by 김민서 on 5/18/24.
//

import UIKit

import SnapKit
import Sopkathon_iOS_Extension
import Then

final class NumOfFriendsViewController: UIViewController {
    
    private let characterImageView = UIImageView().then {
        $0.image = .imgOnboarding2
    }
    private let friendsLabel = UILabel().then {
        $0.text = "내가 친해지고 싶은 친구는.."
        $0.textColor = .white
        $0.textAlignment = .center
        $0.numberOfLines = 1
        $0.font = .title1_b_28
    }
    
    private let numTextField = UITextField().then {
        $0.font = .body3_sb_22
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .white
        $0.textColor = .gray15
        $0.textAlignment = .center
        $0.keyboardType = .numberPad
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray08,
            .font: UIFont.body3_sb_22
        ]
        let attributedPlaceholder = NSAttributedString(string: "0", attributes: attributes)
        $0.attributedPlaceholder = attributedPlaceholder
    }
    
    private let numLabel = UILabel().then {
        $0.text = "명"
        $0.textColor = .white
        $0.textAlignment = .center
        $0.font = .title1_b_28
        $0.numberOfLines = 1
        $0.font = .title1
    }
    
    private lazy var numStackView = UIStackView(arrangedSubviews: [numTextField,numLabel]).then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = 5
    }
    
    
    private lazy var completeButton = CustomButton(title: "완료")
      .setColor(bgColor: .subBlue, disableColor: .gray08)
      .setEnabled(false)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        setDelegate()
    }
}

private extension NumOfFriendsViewController {
    
    func setHierarchy() {
        view.addSubviews(characterImageView,friendsLabel, numStackView, completeButton)
        
    }
    
    func setLayout() {
        self.view.backgroundColor = .background
        //navigationItem.hidesBackButton = true
        
        
        friendsLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(250)
            $0.leading.trailing.equalToSuperview()
        }
        
        numTextField.snp.makeConstraints {
            $0.width.equalTo(105)
            $0.height.equalTo(60)
        }
        
        numStackView.snp.makeConstraints {
            $0.top.equalTo(friendsLabel.snp.bottom).offset(23)
            $0.centerX.equalToSuperview()
        }
        
        characterImageView.snp.makeConstraints {
            $0.top.equalTo(numStackView.snp.bottom).offset(47)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(223)
            $0.height.equalTo(162)
        }
        
        completeButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(84)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }

    }
    
    func setDelegate() {
        numTextField.delegate = self
    }
}

extension NumOfFriendsViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        updateButtonState(for: textField.text ?? "")
    }
    
    private func updateButtonState(for text: String) {
        let regularExpression = "^[0-9]+$"
        let target = text
        print(target)
        if target.range(of: regularExpression, options: .regularExpression) != nil {
            completeButton.setEnabled(true)
        } else {
            completeButton.setEnabled(false)
        }

    }
}
