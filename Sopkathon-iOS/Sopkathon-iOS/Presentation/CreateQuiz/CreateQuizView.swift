import UIKit

import SnapKit
import Sopkathon_iOS_Extension
import Then

final class CreateQuizView: UIView {
    // MARK: properties
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init() {
        super.init(frame: .zero)
        setUI()
        setLayout()
        setConfig()
    }
    // MARK: - UIComponents
    let navigationView = QuizNavigationView()
    let collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.backgroundColor = .lightGray
        $0.isPagingEnabled = true
        $0.register(CreateQuizCollectionViewCell.self,
                    forCellWithReuseIdentifier: CreateQuizCollectionViewCell.reuseIdentifier)
    }
    // MARK: - Life Cycles
    // MARK: - UI & Layout
    private func setUI() {
        self.backgroundColor = .lightGray
    }
    
    private func setLayout() {
        self.addSubviews(navigationView, collectionView)
        
        navigationView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    // MARK: - Methods
    private func setConfig() {
        self.collectionView.delegate = self
    }
    // MARK: - Data Source
    // MARK: - Actions
}
// MARK: - Delegate
extension CreateQuizView: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        navigationView.pageIndexView.setIndex(offsetX: scrollView.contentOffset.x)
    }
}
