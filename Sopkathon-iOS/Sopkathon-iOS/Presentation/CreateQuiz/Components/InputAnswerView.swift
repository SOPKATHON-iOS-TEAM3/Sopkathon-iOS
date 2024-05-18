import UIKit

import SnapKit
import Sopkathon_iOS_Extension
import Then


final class InputAnswerView: UIView {
    // MARK: properties
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    init() {
        super.init(frame: .zero)
        setUI()
        setLayout()
    }
    // MARK: - UIComponents
    let textField = UITextField()
    private let iconImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    // MARK: - Life Cycles
    // MARK: - UI & Layout
    private func setUI() {
        backgroundColor = .white
    }

    private func setLayout() {
        self.addSubviews(textField, iconImageView)
        
        textField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(14)
            $0.centerY.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints {
            $0.top.trailing.bottom.equalToSuperview().inset(11)
            $0.size.equalTo(48)
        }
    }
    // MARK: - Methods
    // MARK: - Data Source
    // MARK: - Delegate
    // MARK: - Actions
}
