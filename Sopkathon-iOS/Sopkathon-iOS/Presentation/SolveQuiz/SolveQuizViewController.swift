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

struct QuizDummy {
    var quizStr = ["내 퍼스널 컬러는?", "내 주량은?", "난 댕댕이파 vs 냥냥이파"]
    var firstAnswerArray = ["봄웜", "내 주량은?", "댕댕"]
    var secondAnswerArray = ["겨울쿨", "소주 한잔", "냥냥"]
}

final class SolveQuizViewController: UIViewController {
    
    // MARK: - Properties
    
    var dummy = QuizDummy()
    
    var index = 0
    var backgroundColors: [UIColor] = [.subBlue, .mainPink, .subPurple]
    
    // MARK: - UI Components
    
    private let navigationView = QuizNavigationView()
    
    private let flowLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
        $0.minimumInteritemSpacing = 0
        $0.minimumLineSpacing = 0
        $0.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
    
    private lazy var solveQuizCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout).then {
        $0.backgroundColor = .subBlue
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
    
    private func postUserChoices() {
        let req = PostUserChoiceRequest(memberId: 0, questionId: 1, answerId: 1)
        SolveQuizService.shared.postUserChoice(req: req, completion: { response in
            switch response {
            case .success(let data):
                guard let data = data as? SignUpMemberResponseModel else { return }
                print("답변이 전송되었습니다~")
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
        })
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
        dummy.quizStr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SolveQuizCollectionViewCell.className,
            for: indexPath
        ) as? SolveQuizCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.delegate = self
        cell.questionLabel.text = dummy.quizStr[indexPath.row]
        cell.firstAnswerView.answerLabel.text = dummy.firstAnswerArray[indexPath.row]
        cell.secondAnswerView.answerLabel.text = dummy.secondAnswerArray[indexPath.row]
        return cell
    }
}

// MARK: - NextButtonProtocol

extension SolveQuizViewController: NextButtonProtocol {
    func pagingToNextQuestion() {
        solveQuizCollectionView.backgroundColor = backgroundColors[min(index + 1, 2)]
        solveQuizCollectionView.setContentOffset(CGPoint(x: Int(UIScreen.main.bounds.width) * min(index + 1, 2), y: 0), animated: true)
        
        if index == 2 {
            showResultQuizViewController()
        }
        
        postUserChoices()
    }
}
