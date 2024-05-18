//
//  HomeViewController.swift
//  Sopkathon-iOS
//
//  Created by 이명진 on 5/19/24.
//

import UIKit

import SnapKit
import Sopkathon_iOS_Extension
import Then
import Combine

final class HomeViewController: UIViewController {
    
    // MARK: - UIComponents
    private let logoView = UIImageView().then {
        $0.backgroundColor = .red
    }
    
    private let homeMainTitleLabel = UILabel().then {
        $0.text = "00 님의 tootoo"
        $0.font = .title1_b_28
    }
    
    private let friendInfoView = UIView().then {
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 10
    }
    
    private let presentFriendLabel = UILabel().then {
        $0.text = "현재 친해져야 하는 친구"
        $0.font = .body2_m_16
        $0.textColor = .white
    }
    
    private let numOfFriendLabel = UILabel().then {
        $0.text = "7명"
        $0.font = .body2_m_16
        $0.textColor = .white
    }
    
    private let backgroundCloudImageView = UIImageView().then {
        $0.image = .imgCloud
    }
    
    private let MainView = UIView().then {
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 10
    }
    
    private let pointHomeMainLabel = UILabel().then {
        $0.text = "0"
        $0.font = .count_sb_100
        $0.textColor = .white
    }
    
    private let pointHomeMainInfoLabel = UILabel().then {
        $0.text = "나랑 친해지길 기다리는 친구가 0명 남았어요!"
        $0.numberOfLines = 2
        $0.font = .body3_sb_22
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private lazy var makeQuizButton = UIButton().then {
        $0.setTitle("퀴즈 만들기", for: .normal)
        $0.backgroundColor = .red
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(pushToMakeQuizViewController), for: .touchUpInside)
    }
    
    private lazy var solveQuizButton = UIButton().then {
        $0.setTitle("퀴즈 풀기", for: .normal)
        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(pushToSolveQuizViewController), for: .touchUpInside)
    }
    
    private let infoView = UIView().then {
        $0.backgroundColor = .brown
    }
    
    private lazy var topVStackView = UIStackView(
        arrangedSubviews: [
            homeMainTitleLabel,
            friendInfoView
        ]
    ).then {
        $0.axis = .vertical
        $0.spacing = 22
        $0.alignment = .leading
        $0.distribution = .fill
    }
    
    private lazy var middleVStackView = UIStackView(
        arrangedSubviews: [
            MainView,
            bottomHStackView
        ]
    ).then {
        $0.axis = .vertical
        $0.spacing = 14
        $0.alignment = .fill
    }
    
    private lazy var bottomHStackView = UIStackView(
        arrangedSubviews: [
            makeQuizButton,
            solveQuizButton
        ]
    ).then {
        $0.axis = .horizontal
        $0.spacing = 10
        $0.distribution = .fillEqually
    }
    
    private let bottomView = UIView().then {
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .zeroPink
    }
    
    private let resultInfoView = UILabel().then {
        $0.text = "모두와 친해 졌네요!"
        $0.font = .body8_r_12
        $0.textColor = .white
    }
    
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setHierarchy()
        setLayout()
        setDelegate()
        setRegister()
        
    }
    // MARK: - UI & Layout
    
    private func setUI() {
        view.backgroundColor = .zeroPink
    }
    
    private func setHierarchy() {
        view.addSubviews(
            topVStackView,
            middleVStackView,
            bottomView,
            backgroundCloudImageView
        )
        
        friendInfoView.addSubviews(
            presentFriendLabel,
            numOfFriendLabel
        )
        
        MainView.addSubviews(
            pointHomeMainLabel,
            pointHomeMainInfoLabel
        )
        
        bottomView.addSubview(resultInfoView)
    }
    
    private func setLayout() {
        topVStackView.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(99)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(22 + 39 + 50)
        }
        
        friendInfoView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        middleVStackView.snp.makeConstraints {
            $0.top.equalTo(topVStackView.snp.bottom).offset(13)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalTo(view.snp.bottom).inset(90)
        }
        
        MainView.snp.makeConstraints {
            $0.width.equalTo(335)
            $0.height.equalTo(355)
        }
        
        makeQuizButton.snp.makeConstraints {
            $0.width.equalTo(163)
            $0.height.equalTo(160)
        }
        
        solveQuizButton.snp.makeConstraints {
            $0.width.equalTo(163)
            $0.height.equalTo(160)
        }
        
        presentFriendLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(10)
            $0.centerY.equalToSuperview()
        }
        
        numOfFriendLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(10)
            $0.centerY.equalToSuperview()
        }
        
        pointHomeMainLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(73)
        }
        
        pointHomeMainInfoLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(pointHomeMainLabel.snp.bottom).offset(46)
            $0.width.equalTo(267)
        }
        
        bottomView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(19)
            $0.height.equalTo(40)
            $0.top.equalTo(middleVStackView.snp.bottom).offset(16)
        }
        
        resultInfoView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        backgroundCloudImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(99)
            $0.trailing.equalToSuperview()
        }
        
        view.bringSubviewToFront(topVStackView)
        view.bringSubviewToFront(middleVStackView)
    }
    
    
    // MARK: - Methods
    
    
    private func setDelegate() {
        
    }
    
    private func setRegister() {
        
    }
    
    @objc
    private func pushToMakeQuizViewController() {
        let vc = ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    private func pushToSolveQuizViewController() {
        let vc = SolveQuizViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
