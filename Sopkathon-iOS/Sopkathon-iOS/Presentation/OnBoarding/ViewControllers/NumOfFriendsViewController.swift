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

import Moya

final class NumOfFriendsViewController: UIViewController {
    
    let userProvider = MoyaProvider<UserTargetType>(
        plugins:  [MoyaLoggingPlugin()]
    )
    
    private var nickName: String?
    
    private let logoImageView = UIImageView().then {
        $0.image = .logo
    }
    
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
        .setEnabled(false).then {
            $0.addTarget(self, action: #selector(completeButtonDidTap), for: .touchUpInside)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        setDelegate()
        setupTapGesture()
    }
}

extension NumOfFriendsViewController {
    
    func setHierarchy() {
        view.addSubviews(logoImageView,characterImageView,friendsLabel, numStackView, completeButton)
        
    }
    
    func setLayout() {
        self.view.backgroundColor = .background
        navigationItem.hidesBackButton = true
        
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(70)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(161)
            $0.height.equalTo(28)
        }
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
    
    
    
    func setLabelText(nickName: String?) {
        self.nickName = nickName
    }
    
    @objc private func completeButtonDidTap() {
        guard let nickName = self.nickName else { return }
        guard let targetFriendText = self.numTextField.text, let targetFriend = Int(targetFriendText) else {
            print("텍스트를 Int로 변환 개같이 실패")
            return
        }
        let request = SignUpMemberRequestModel(
            nickName: nickName,
            targetFriend: targetFriend
        )
        print(targetFriendText)
        MemberService.shared.signUp(request: request) { [weak self] response in
            switch response {
            case .success(let data):
                print("성공")
                self?.pushToHomeVC()
                guard let data = data as? SignUpMemberResponseModel else {
                    print("디코딩 안돼")
                    return }
                dump(data)
            case .requestErr:
                print("요청 오류 입니다")
            case .decodedErr:
                print("디코딩 오류 입니다")
            case .pathErr:
                print("경로 오류 입니다")
            case .serverErr:
                print("서버 오류입니다")
            case .networkFail:
                print("네트워크 오류입니다")
            }
        }
        
    }
    private func pushToHomeVC() {
        let homeViewController = HomeViewController()
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

extension NumOfFriendsViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        updateButtonState(for: textField.text ?? "")
    }
    
    private func updateButtonState(for text: String) {
        let regularExpression = "^[0-9]+$"
        let target = text
        if target.range(of: regularExpression, options: .regularExpression) != nil {
            completeButton.setEnabled(true)
        } else {
            completeButton.setEnabled(false)
        }
        
    }
}
