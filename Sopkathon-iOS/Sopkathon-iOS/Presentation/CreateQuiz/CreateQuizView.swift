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
        $0.isScrollEnabled = false
        $0.register(CreateQuizCollectionViewCell.self,
                    forCellWithReuseIdentifier: CreateQuizCollectionViewCell.reuseIdentifier)
    }
    let button = CustomButton(title: "다음")
        .setColor(bgColor: UIColor(hexCode: "#343641", alpha: 1.0),
                  disableColor: UIColor(hexCode: "#343641", alpha: 1.0),
                  textColor: .white)
    // MARK: - Life Cycles
    // MARK: - UI & Layout
    private func setUI() {
        self.backgroundColor = UIColor(hexCode: "#018CF1")
    }
    
    private func setLayout() {
        self.addSubviews(navigationView, collectionView, button)
        
        navigationView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.bottom).offset(64)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        button.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(18)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
    }
    // MARK: - Methods
    private func setConfig() {
        self.collectionView.delegate = self
        self.collectionView.backgroundColor = .clear
    }
    // MARK: - Data Source
    // MARK: - Actions
}
// MARK: - Delegate
extension CreateQuizView: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        navigationView.pageIndexView.setIndex(offsetX: scrollView.contentOffset.x)
        switch navigationView.pageIndexView.index {
        case 0:
            self.backgroundColor = UIColor(hexCode: "#018CF1")
        case 1:
            self.backgroundColor = UIColor(hexCode: "#E93660")
        default:
            self.backgroundColor = UIColor(hexCode: "#6147FE")
        }
    }
}
