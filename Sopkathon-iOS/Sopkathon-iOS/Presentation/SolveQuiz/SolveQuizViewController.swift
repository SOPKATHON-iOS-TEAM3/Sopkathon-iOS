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
    
    var index = 0
    
    // MARK: - UI Components
    
    private let navigationView = QuizNavigationView()
    
    private let flowLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
        $0.minimumInteritemSpacing = 0
        $0.minimumLineSpacing = 0
        $0.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
        
    private lazy var solveQuizCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout).then {
        $0.backgroundColor = .gray
        $0.showsHorizontalScrollIndicator = false
        $0.isScrollEnabled = false
        $0.delegate = self
        $0.dataSource = self
        $0.contentInsetAdjustmentBehavior = .never
        $0.register(SolveQuizCollectionViewCell.self, forCellWithReuseIdentifier: SolveQuizCollectionViewCell.className)
    }
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setLayout()
    }
    
    // MARK: - UI&Layout
    
    private func setLayout() {
        view.addSubviews(
            solveQuizCollectionView,
            navigationView
        )
        
        navigationView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(24)
            $0.leading.trailing.equalToSuperview()
        }
        
        solveQuizCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func showResultQuizViewController() {
        let resultQuizViewController = ResultQuizViewController()
        self.navigationController?.pushViewController(resultQuizViewController, animated: true)
    }
}

// MARK: - UICollectionViewDelegate

extension SolveQuizViewController: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.index = Int(max(ceil(((UIScreen.main.bounds.width / 2.0) + scrollView.contentOffset.x) / UIScreen.main.bounds.width) - 1, 0))
        navigationView.pageIndexView.setIndex(selectedIndex: index)
    }
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
        cell.delegate = self
        return cell
    }
}

// MARK: - NextButtonProtocol

extension SolveQuizViewController: NextButtonProtocol {
    func pagingToNextQuestion() {
        solveQuizCollectionView.setContentOffset(CGPoint(x: Int(UIScreen.main.bounds.width) * min(index + 1, 2), y: 0), animated: true)

        if index == 2 {
            showResultQuizViewController()
        }
    }
}
