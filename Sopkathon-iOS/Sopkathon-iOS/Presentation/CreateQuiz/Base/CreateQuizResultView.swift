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
    let titleLabel = UILabel().then {
        $0.font = .title1_b_28
        $0.textColor = .white
        $0.text = "퀴즈가 완성되었어요!"
    }
    let contentImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.image = UIImage(resource: .resultContent)
    }
    let copyCodeView = CopyCodeView()
    let button = CustomButton(title: "홈으로")
        .setColor(bgColor: UIColor(hexCode: "#018CF1", alpha: 1.0),
                  disableColor: UIColor(hexCode: "#018CF1", alpha: 1.0),
                  textColor: .white)
    
    // MARK: - Life Cycles
    // MARK: - UI & Layout
    private func setUI() {
        self.backgroundColor = UIColor(hexCode: "#262833",
                                       alpha: 1.0)
    }
    
    private func setLayout() {
        self.addSubviews(titleLabel,
                         contentImageView,
                         copyCodeView,
                         button)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(86)
            $0.centerX.equalToSuperview()
        }
        
        contentImageView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(54)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(295)
            $0.height.equalTo(154)
        }
        
        copyCodeView.snp.makeConstraints {
            $0.top.equalTo(contentImageView.snp.bottom).offset(80)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        button.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(18)
            $0.leading.trailing.equalToSuperview().inset(21)
            $0.height.equalTo(60)
        }
        
    }
    // MARK: - Methods
    private func setConfig() {
    }
    // MARK: - Data Source
    // MARK: - Actions
}
// MARK: - Delegate
