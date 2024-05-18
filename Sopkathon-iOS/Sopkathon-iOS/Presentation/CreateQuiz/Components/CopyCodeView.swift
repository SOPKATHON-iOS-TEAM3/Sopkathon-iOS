import UIKit

import SnapKit
import Sopkathon_iOS_Extension
import Then

final class CopyCodeView: UIView {
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
    private let iconImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.image = .icCodeIcon
    }
    private let contentImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    private let titleLabel = UILabel().then {
        $0.font = .title4_b_18
        $0.textColor = .white
        $0.text = "초대코드 복사하기"
    }
    private let codeLabel = UILabel().then {
        $0.font = .body7_m_18
        $0.textColor = .white
    }
    private let descriptionLabel = UILabel().then {
        $0.font = .body8_r_12
        $0.textColor = .white
    }
    
    // MARK: - Life Cycles
    // MARK: - UI & Layout
    private func setUI() {
        self.backgroundColor = .lightGray
    }
    
    private func setLayout() {
        self.addSubviews(iconImageView,
                         contentImageView,
                         titleLabel,
                         codeLabel,
                         descriptionLabel)
        iconImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.leading.equalToSuperview().offset(20)
            $0.size.equalTo(12)
        }
        titleLabel.snp.makeConstraints {
            $0.centerY.equalTo(iconImageView)
            $0.leading.equalTo(iconImageView.snp.trailing).offset(4)
        }
        codeLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(24)
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(codeLabel.snp.bottom).offset(31)
            $0.bottom.equalToSuperview().inset(14)
            $0.leading.equalToSuperview().offset(24)
        }
        contentImageView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(14)
            $0.trailing.equalToSuperview().offset(27)
            $0.width.equalTo(175)
            $0.height.equalTo(144)
        }
        
    }
    // MARK: - Methods
    private func setConfig() {
    }
    // MARK: - Data Source
    func bindData(code: String) {
        codeLabel.text = code
    }
    // MARK: - Actions
}
// MARK: - Delegate
