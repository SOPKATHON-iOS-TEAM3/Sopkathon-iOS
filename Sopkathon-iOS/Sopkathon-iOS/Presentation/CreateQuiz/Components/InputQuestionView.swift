import UIKit

import SnapKit
import Sopkathon_iOS_Extension
import Then


final class InputQuestionView: UIView {
    // MARK: properties
    var isEditing: Bool = false {
        didSet {
            placeHolderLabel.isHidden = isEditing
        }
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init() {
        super.init(frame: .zero)
        setLayout()
        setUI()
    }
    // MARK: - UIComponents
    let textView = UITextView()
    let placeHolderLabel = UILabel().then {
        $0.textAlignment = .left
    }
    // MARK: - Life Cycles
    // MARK: - UI & Layout
    private func setUI() {
        backgroundColor = .white
    }
    private func setLayout() {
        self.addSubviews(textView,
                         placeHolderLabel)
        
        textView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(10)
            $0.leading.trailing.equalToSuperview().inset(14)
        }
        
        placeHolderLabel.snp.makeConstraints {
            $0.top.leading.equalTo(textView)
        }
    }
    // MARK: - Methods
    // MARK: - Data Source
    // MARK: - Delegate
    // MARK: - Actions
}
