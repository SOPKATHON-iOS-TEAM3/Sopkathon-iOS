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
    
    private let logoImageView = UIImageView(image: .logoType)
    
    private let friendsLabel = UILabel().then {
        $0.text = "내가 친해지고 싶은 친구는.."
        $0.textColor = .white
        $0.textAlignment = .center
        $0.numberOfLines = 1
        $0.font = .title1
    }
    
    private let numTextField = UITextField().then {
        $0.font = .title1
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .white
        $0.textColor = .gray15
        $0.textAlignment = .center
        $0.keyboardType = .numberPad
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black,
            .font: UIFont.title1
        ]
        let attributedPlaceholder = NSAttributedString(string: "0", attributes: attributes)
        $0.attributedPlaceholder = attributedPlaceholder
    }
    
    private let numLabel = UILabel().then {
        $0.text = "명"
        $0.textColor = .white
        $0.textAlignment = .center
        $0.numberOfLines = 1
        $0.font = .title1
    }
    
    private lazy var numStackView = UIStackView(arrangedSubviews: [numTextField,numLabel]).then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = 5
    }
    
    
    private lazy var completeButton = CustomButton(title: "완료")
      .setColor(bgColor: .mainPink, disableColor: .gray08)
      .setEnabled(true)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        setDelegate()
    }
}

private extension NumOfFriendsViewController {
    
    func setHierarchy() {
        view.addSubviews(logoImageView, friendsLabel, numStackView, completeButton)
        
    }
    
    func setLayout() {
        self.view.backgroundColor = .background
        //navigationItem.hidesBackButton = true
        
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(58)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(150)
            $0.height.equalTo(70)
        }
        
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
        numTextField.delegate = self
    }
}

extension NumOfFriendsViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
        guard Int(string) != nil || string == "" else { return false }
            
        return true
    }
    

  
}
