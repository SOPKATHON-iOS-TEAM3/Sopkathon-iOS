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
        setConfig()
    }
    // MARK: - UIComponents
    let textView = UITextView().then {
        $0.font = .body4_r_16
        $0.textColor = .black
        $0.tintColor = UIColor(hexCode: "#A5A5A5", alpha: 1.0)
    }
    let placeHolderLabel = UILabel().then {
        $0.textAlignment = .left
        $0.font = .body4_r_16
        $0.textColor = UIColor(hexCode: "#A5A5A5", alpha: 1.0)
    }
    // MARK: - Life Cycles
    // MARK: - UI & Layout
    private func setUI() {
        backgroundColor = .white
    }
    
    private func setConfig() {
        self.textView.delegate = self
    }
    private func setLayout() {
        self.addSubviews(textView,
                         placeHolderLabel)
        
        textView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(4)
            $0.bottom.equalToSuperview().inset(6)
            $0.leading.equalToSuperview().offset(6)
            $0.trailing.equalToSuperview().inset(6)
        }
        
        placeHolderLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(14)
        }
    }
    // MARK: - Methods
    // MARK: - Data Source
    // MARK: - Delegate
    // MARK: - Actions
}
extension InputQuestionView: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let maxLength = 30
        if textView.text.count > maxLength {
            textView.text = String(textView.text.prefix(maxLength))
        }
        if textView.text.count > 0 {
            self.isEditing = true
        } else {
            self.isEditing = false
        }
    }
}
