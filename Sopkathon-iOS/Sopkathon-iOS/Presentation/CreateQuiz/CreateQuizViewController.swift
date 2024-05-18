import UIKit

class CreateQuizeViewController: UIViewController {
    // MARK: properties
    private var createQuizViewDataModel: CreateQuizViewDataModel = .init(item: [.init(order: 1,
                                                                                      title: "첫번째 질문을 만들어보세요.",
                                                                                      subTitle: "정답과 오답을 입력해주세요.",
                                                                                      subTitleThin: "퀴즈에는 선지가 랜덤으로 보여져요",
                                                                                      quizQuestionList: .init(placeHolder: "ex. 내 인생 드라마는 최대 30자",
                                                                                                              data: ""),
                                                                                      quizCorrectAnswerList: .init(placeHolder: "정답을 입력하세요. (최대 16자)",
                                                                                                                   data: ""),
                                                                                      quizInCorrectAnswerList: .init(placeHolder: "오답을 입력하세요. (최대 16자)",
                                                                                                                     data: "")),
                                                                                .init(order: 2,
                                                                                      title: "두번째 질문을 만들어보세요.",
                                                                                      subTitle: "정답과 오답을 입력해주세요.\n퀴즈에는 선지가 랜덤으로 보여져요",
                                                                                      subTitleThin: "퀴즈에는 선지가 랜덤으로 보여져요",
                                                                                      quizQuestionList: .init(placeHolder: "ex.저의 MBTI는 E일까요 I일까요? 최대 30자",
                                                                                                              data: ""),
                                                                                      quizCorrectAnswerList: .init(placeHolder: "정답을 입력하세요. (최대 16자)",
                                                                                                                   data: ""),
                                                                                      quizInCorrectAnswerList: .init(placeHolder: "오답을 입력하세요. (최대 16자)",
                                                                                                                     data: "")),
                                                                                .init(order: 3,
                                                                                      title: "세번째 질문을 만들어보세요.",
                                                                                      subTitle: "정답과 오답을 입력해주세요.\n퀴즈에는 선지가 랜덤으로 보여져요",
                                                                                      subTitleThin: "퀴즈에는 선지가 랜덤으로 보여져요",
                                                                                      quizQuestionList: .init(placeHolder: "ex. 내 인생 드라마는 최대 30자",
                                                                                                              data: ""),
                                                                                      quizCorrectAnswerList: .init(placeHolder: "정답을 입력하세요. (최대 16자)",
                                                                                                                   data: ""),
                                                                                      quizInCorrectAnswerList: .init(placeHolder: "오답을 입력하세요. (최대 16자)",
                                                                                                                     data: ""))])
    // MARK: - UIComponents
    private let createQuizeView = CreateQuizView()
    // MARK: - Life Cycles
    override func loadView() {
        super.loadView()
        self.view = createQuizeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindDataSource()
        setDataSource()
        setConfig()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setCollectionViewLayout()
    }
    // MARK: - UI & Layout
    private func setCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = createQuizeView.collectionView.bounds.size
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        createQuizeView.collectionView.setCollectionViewLayout(layout, animated: true)
    }
    // MARK: - Methods
    private func setConfig() {
        createQuizeView.navigationView.delegate = self
        createQuizeView.button.addTarget(self,
                                         action: #selector(didButtonTapped(_:)),
                                         for: .touchUpInside)
    }
    
    @objc private func didButtonTapped(_ sender: UIButton) {
        let index = createQuizeView.navigationView.pageIndexView.index
        switch index {
        case 0:
            self.getCurrentPageInfo(index: 0)
        case 1:
            self.getCurrentPageInfo(index: 1)
        default:
            self.getCurrentPageInfo(index: 2)
        }
        
    }
    
    
    private func getCurrentPageInfo(index: Int) {
        switch index {
        case 0:
            if let currentCell = createQuizeView.collectionView.cellForItem(at: .init(row: 0, section: 0)) as? CreateQuizCollectionViewCell {
                currentCell.getCellCurrentData()
            }
        case 1:
            if let currentCell = createQuizeView.collectionView.cellForItem(at: .init(row: 1, section: 0)) as? CreateQuizCollectionViewCell {
                currentCell.getCellCurrentData()
            }
        default:
            if let currentCell = createQuizeView.collectionView.cellForItem(at: .init(row: 2, section: 0)) as? CreateQuizCollectionViewCell {
                currentCell.getCellCurrentData()
            }
        }
    }
    // MARK: - Data Source
    private var createQuizDict = [UUID: CreateQuizViewDataItem]()
    private var datasource: UICollectionViewDiffableDataSource<Int, UUID>!
    
    private func setDataSource() {
        let dataTuple = createQuizViewDataModel.item.map { ($0.identifier, $0) }
        createQuizDict = Dictionary(uniqueKeysWithValues: dataTuple)
        let keyList = createQuizDict.sorted(by: {
            $0.value.order < $1.value.order
        }).map {
            $0.key
        }.map { $0 }
        var snapShot = datasource.snapshot()
        snapShot.appendSections([0])
        snapShot.appendItems(keyList, toSection: 0)
        datasource.apply(snapShot)
    }
    
    private func bindDataSource() {
        datasource = UICollectionViewDiffableDataSource(collectionView: createQuizeView.collectionView,
                                                        cellProvider: { collectionView, indexPath, identifier in
            guard let cell = self.createQuizeView.collectionView.dequeueReusableCell(withReuseIdentifier: CreateQuizCollectionViewCell.reuseIdentifier, for: indexPath) as? CreateQuizCollectionViewCell else { return UICollectionViewCell() }
            if let item = self.createQuizDict[identifier] {
                cell.bindData(data: item)
            }
            cell.delegate = self
            
            return cell
        })
    }
    // MARK: - Delegate
    // MARK: - Actions
}
extension CreateQuizeViewController: QuizeNavigationProtocol {
    func backButtonTap() {
        self.navigationController?.popViewController(animated: true)
    }
}
extension CreateQuizeViewController: CreateQuizProtocol {
    func getItem(data: CreateQuizViewDataItem) {
        let index = createQuizeView.navigationView.pageIndexView.index
        switch index {
        case 0:
            createQuiz(data: data,
                       index: index)
            self.createQuizeView.collectionView.setContentOffset(.init(x: Int(UIScreen.main.bounds.width), y: 0), animated: true)
        case 1:
            createQuiz(data: data,
                       index: index)
            self.createQuizeView.collectionView.setContentOffset(.init(x: Int(UIScreen.main.bounds.width) * 2, y: 0), animated: true)
        default:
            let vc = CreateQuizResultViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        print(data)
    }
}

extension CreateQuizeViewController {
    func createQuiz(data: CreateQuizViewDataItem,
                    index: Int) {
        CreateQuizService.shared.postCreateQuiz(body: .init(quizID: index,
                                                            questionText: data.quizQuestionList.data),
                                                completion: { result in
            switch result {
            case .success(let t):
                if let result = t as? CreateQuizResponseDTO {
                    print(result.message)
                    self.createAnswer(data: data,
                                      index: index)
                }
            case .requestErr:
                print("requestErr")
            case .decodedErr:
                print("decodedErr")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        })
    }
    
    func createAnswer(data: CreateQuizViewDataItem,
                      index: Int) {
        CreateQuizService.shared.postCreateAnswer(body: .init(questionID: index,
                                                              answers: [.init(answerText: data.quizCorrectAnswerList.data,
                                                                              isCorrect: true),
                                                                        .init(answerText: data.quizInCorrectAnswerList.data,
                                                                              isCorrect: true)]), completion: { result in
            switch result {
            case .success(let t):
                if let result = t as? CreateQuizResponseDTO {
                    print(result.message)
                }
            case .requestErr:
                print("requestErr")
            case .decodedErr:
                print("decodedErr")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
            
        })
    }
}
