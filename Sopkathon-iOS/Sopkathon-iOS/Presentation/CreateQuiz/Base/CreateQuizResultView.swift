import UIKit

import SnapKit
import Sopkathon_iOS_Extension
import Then

final class CreateQuizResultView: UIView {
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
    let contentStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fill
    }
    let titleLabel = UILabel().then {
        $0.font = .title1_b_28
        $0.textColor = .white
        $0.text = "퀴즈가 완성되었어요!"
    }
    let copyCodeView = CopyCodeView()
    
    // MARK: - Life Cycles
    // MARK: - UI & Layout
    private func setUI() {
        self.backgroundColor = .lightGray
    }
    
    private func setLayout() {
        self.addSubviews(contentStackView)
        contentStackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        contentStackView.addArrangeSubviews(titleLabel,
                                            contentStackView)
    }
    // MARK: - Methods
    private func setConfig() {
    }
    // MARK: - Data Source
    // MARK: - Actions
}
// MARK: - Delegate
