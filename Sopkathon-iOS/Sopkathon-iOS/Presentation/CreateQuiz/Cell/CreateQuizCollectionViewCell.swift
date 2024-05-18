import UIKit

import SnapKit
import Sopkathon_iOS_Extension
import Then

final class CreateQuizCollectionViewCell: UICollectionViewCell {
    weak var delegate: CreateQuizProtocol?

    // MARK: properties
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    // MARK: - UIComponents
    private let contentStackView = UIStackView().then {
        $0.distribution = .fill
        $0.spacing = 20
        $0.axis = .vertical
    }
    
    private let quizTitleLabel = PaddingLabel().then {
        $0.font = .btn_b_22
        $0.textColor = .white
    }
    private let quizTextView = InputQuestionView().then {
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }
    
    private let quizSubTitleLabel = PaddingLabel().then {
        $0.font = .btn_b_22
        $0.textColor = .white
    }
    private let quizeSubTitleThinLabel = PaddingLabel().then {
        $0.font = .body5_r_14
        $0.textColor = .white
    }
    private let quizCorrectAnswerView = InputAnswerView().then {
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.iconImageView.image = .icAnswer
    }
    private let quizInCorrectAnswerView = InputAnswerView().then {
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.iconImageView.image = .icWrong
    }
    // MARK: - Life Cycles
    // MARK: - UI & Layout
    private func setLayout() {
        self.contentView.backgroundColor = .clear
        self.contentView.addSubview(contentStackView)
        
        contentStackView.addArrangeSubviews(quizTitleLabel,
                                            quizTextView,
                                            quizSubTitleLabel,
                                            quizeSubTitleThinLabel,
                                            quizCorrectAnswerView,
                                            quizInCorrectAnswerView)
        
        contentStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalToSuperview()
            $0.size.lessThanOrEqualTo(UIScreen.main.bounds.size).priority(.low)
        }
        
        
        quizTextView.snp.makeConstraints {
            $0.height.equalTo(90)
        }
        
        contentStackView.setCustomSpacing(90, after: quizTextView)
        contentStackView.setCustomSpacing(6, after: quizSubTitleLabel)
        contentStackView.setCustomSpacing(10, after: quizCorrectAnswerView)
    }
    // MARK: - Methods
    // MARK: - Data Source
    var item: CreateQuizViewDataItem?
    func bindData(data: CreateQuizViewDataItem) {
        self.item = data
        quizTitleLabel.text = data.title
        quizSubTitleLabel.text = data.subTitle
        quizeSubTitleThinLabel.text = data.subTitleThin
        quizTextView.placeHolderLabel.text = data.quizQuestionList.placeHolder
        quizCorrectAnswerView.textField.placeholder = data.quizCorrectAnswerList.placeHolder
        quizInCorrectAnswerView.textField.placeholder = data.quizInCorrectAnswerList.placeHolder
    }
    func getCellCurrentData() {
        guard let item else { return }
        delegate?.getItem(data: .init(order: item.order,
                                      title: item.title,
                                      subTitle: item.subTitle,
                                      subTitleThin: item.subTitleThin,
                                      quizQuestionList: .init(placeHolder: item.quizQuestionList.placeHolder,
                                                              data: quizTextView.textView.text),
                                      quizCorrectAnswerList: .init(placeHolder: item.quizCorrectAnswerList.placeHolder,
                                                                   data: quizCorrectAnswerView.textField.text ?? ""),
                                      quizInCorrectAnswerList: .init(placeHolder: item.quizInCorrectAnswerList.placeHolder,
                                                                     data: quizInCorrectAnswerView.textField.text ?? "")))
    }
    // MARK: - Delegate
    // MARK: - Actions
}
