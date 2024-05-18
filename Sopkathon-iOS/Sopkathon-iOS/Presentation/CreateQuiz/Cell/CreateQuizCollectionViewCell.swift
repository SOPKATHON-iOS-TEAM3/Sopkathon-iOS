import UIKit

import SnapKit
import Sopkathon_iOS_Extension
import Then

final class CreateQuizCollectionViewCell: UICollectionViewCell {
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
    
    private let quizTitleLabel = PaddingLabel()
    private let quizTextView = InputQuestionView()
    
    private let quizSubTitleLabel = PaddingLabel().then {
        $0.numberOfLines = 0
    }
    private let quizCorrectAnswerView = InputAnswerView()
    private let quizInCorrectAnswerView = InputAnswerView()
    // MARK: - Life Cycles
    // MARK: - UI & Layout
    private func setLayout() {
        self.contentView.addSubview(contentStackView)
        
        contentStackView.addArrangeSubviews(quizTitleLabel,
                                            quizTextView,
                                            quizSubTitleLabel,
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
        contentStackView.setCustomSpacing(10, after: quizCorrectAnswerView)
    }
    // MARK: - Methods
    // MARK: - Data Source
    func bindData(data: CreateQuizViewDataItem) {
        quizTitleLabel.text = data.title
        quizSubTitleLabel.text = data.subTitle
        quizCorrectAnswerView.textField.placeholder = data.quizCorrectAnswerList.placeHolder
        quizInCorrectAnswerView.textField.placeholder = data.quizInCorrectAnswerList.placeHolder
    }
    // MARK: - Delegate
    // MARK: - Actions
}
