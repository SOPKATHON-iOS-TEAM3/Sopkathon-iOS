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
    
    private let friendsLabel = UILabel().then {
        $0.text = "내가 친해지고 싶은 친구는.."
        $0.textColor = .black
        $0.textAlignment = .center
        $0.numberOfLines = 1
        $0.font = .title1
    }
    
    private let numTextField = UITextField().then {
        $0.font = .title1
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .gray
        $0.textColor = .white
        $0.textAlignment = .center
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black,
            .font: UIFont.title1
        ]
        let attributedPlaceholder = NSAttributedString(string: "0", attributes: attributes)
        $0.attributedPlaceholder = attributedPlaceholder
    }
    
    private let numLabel = UILabel().then {
        $0.text = "명"
        $0.textColor = .black
        $0.textAlignment = .center
        $0.numberOfLines = 1
        $0.font = .title1
    }
    
    private lazy var numStackView = UIStackView(arrangedSubviews: [numTextField,numLabel]).then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = 5
    }
    
    
    private let completeButton = UIButton().then {
        $0.backgroundColor = .gray
        $0.setTitle("완료", for: .normal)
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

private extension NumOfFriendsViewController {
    
    func setHierarchy() {
        view.addSubviews(friendsLabel, numStackView, completeButton)
        
    }
    
    func setLayout() {
        self.view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        
        friendsLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(241)
            $0.leading.trailing.equalToSuperview()
        }
        
        numTextField.snp.makeConstraints {
            $0.width.equalTo(105)
            $0.height.equalTo(60)
        }
        
        numStackView.snp.makeConstraints {
            $0.top.equalTo(friendsLabel.snp.bottom).offset(87)
            $0.centerX.equalToSuperview()
        }
        
        completeButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(84)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }

    }
    
    func setDelegate() {
        
    }
}
