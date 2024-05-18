//
//  SolveQuizViewController.swift
//  Sopkathon-iOS
//
//  Created by 서은수 on 5/19/24.
//

import UIKit

import SnapKit
import Sopkathon_iOS_Extension
import Then

final class SolveQuizViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    private let flowLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
        $0.minimumInteritemSpacing = 0
        $0.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
        
    private lazy var solveQuizCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout).then {
        $0.backgroundColor = .gray
        $0.showsHorizontalScrollIndicator = false
        $0.delegate = self
        $0.dataSource = self
        $0.register(SolveQuizCollectionViewCell.self, forCellWithReuseIdentifier: SolveQuizCollectionViewCell.className)
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setLayout()
    }
    
    // MARK: - UI&Layout
    
    private func setLayout() {
        view.addSubviews(
            solveQuizCollectionView
        )
        
        solveQuizCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
}

// MARK: - UICollectionViewDelegate

extension SolveQuizViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource

extension SolveQuizViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SolveQuizCollectionViewCell.className,
            for: indexPath
        ) as? SolveQuizCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
}
