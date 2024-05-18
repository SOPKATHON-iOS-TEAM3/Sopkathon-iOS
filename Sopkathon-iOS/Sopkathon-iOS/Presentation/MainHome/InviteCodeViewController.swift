//
//  InviteCodeViewController.swift
//  Sopkathon-iOS
//
//  Created by 이명진 on 5/19/24.
//

import UIKit

import SnapKit
import Sopkathon_iOS_Extension
import Then

final class InviteCodeViewController: UIViewController {
    
    // MARK: - UIComponents
    
    private let infoLabel = UILabel().then {
        $0.text = "공유받은 초대 코드를 입력해주세요."
        $0.numberOfLines = 2
        $0.font = .title1_b_28
        $0.textColor = .white
    }
    
    private lazy var inviteCodeTextField = UITextField().then {
        $0.placeholder = "abcdefg"
        $0.font = .body3_sb_22
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.addLeftPadding(width: 128)
    }
    
    
    private lazy var nextButton = CustomButton(title: "다음")
        .setColor(bgColor: .subBlue, disableColor: .gray15)
        .setEnabled(false)
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setHierarchy()
        setLayout()
        setDelegate()
    }
    
    // MARK: - UI & Layout
    
    private func setUI() {
        view.backgroundColor = .background
    }
    
    
    private func setHierarchy() {
        view.addSubviews(
            infoLabel,
            inviteCodeTextField,
            nextButton
        )
    }
    
    private func setLayout() {
        infoLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.equalTo(78)
            $0.width.equalTo(248)
            $0.top.equalToSuperview().offset(227)
        }
        
        inviteCodeTextField.snp.makeConstraints {
            $0.top.equalTo(infoLabel.snp.bottom).offset(34)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
        
        nextButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(60)
            $0.bottom.equalToSuperview().inset(52)
        }
    }
    
    private func setDelegate() {
        inviteCodeTextField.delegate = self
    }
    
}


extension InviteCodeViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        
        print(text)
        
        //TODO: 조건
        
        nextButton.setEnabled(true)
        
    }
}
