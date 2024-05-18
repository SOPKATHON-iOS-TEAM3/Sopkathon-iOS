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
