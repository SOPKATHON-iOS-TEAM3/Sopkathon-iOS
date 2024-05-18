import UIKit

class CreateQuizeViewController: UIViewController {
    private var createQuizViewDataModel: CreateQuizViewDataModel = .init(item: [.init(title: "첫번째 질문을 만들어보세요.",
                                                                                      subTitle: "정답과 오답을 입력해주세요.\n퀴즈에는 선지가 랜덤으로 보여져요",
                                                                                      quizQuestionList: .init(placeHolder: "ex. 내 인생 드라마는 최대 30자",
                                                                                                              data: ""),
                                                                                      quizCorrectAnswerList: .init(placeHolder: "정답을 입력하세요. (최대 16자)",
                                                                                                                   data: ""),
                                                                                      quizInCorrectAnswerList: .init(placeHolder: "오답을 입력하세요. (최대 16자)",
                                                                                                                     data: ""))])
    private var createQuizDict = [UUID: CreateQuizViewDataItem]()
    private var datasource: UICollectionViewDiffableDataSource<Int, UUID>!
    
    override func loadView() {
        super.loadView()
        self.view = createQuizeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindDataSource()
        setDataSource()
    }
    
    private func setDataSource() {
        let dataTuple = createQuizViewDataModel.item.map { ($0.identifier, $0) }
        createQuizDict = Dictionary(uniqueKeysWithValues: dataTuple)
        var snapShot = datasource.snapshot()
        snapShot.appendSections([0])
        snapShot.appendItems(createQuizDict.keys.map { $0 }, toSection: 0)
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
    
    
    private func setConfig() {
        createQuizeView.navigationView.delegate = self
    }
    
    private let createQuizeView = CreateQuizView()
    
}
extension CreateQuizeViewController: QuizeNavigationProtocol {
    func backButtonTap() {
        self.navigationController?.popViewController(animated: true)
    }
}
