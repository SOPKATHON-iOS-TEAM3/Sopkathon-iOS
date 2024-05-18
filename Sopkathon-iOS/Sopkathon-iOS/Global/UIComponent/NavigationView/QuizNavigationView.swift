import UIKit

import SnapKit
import Sopkathon_iOS_Extension
import Then

class QuizNavigationView: UIView {
    // MARK: properties
    init() {
        super.init(frame: .zero)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    // MARK: - UIComponents
    lazy var backButton = UIButton().then {
        $0.addTarget(self,
                     action: #selector(backButtonTap),
                     for: .touchUpInside)
        $0.setImage(.checkmark, for: .normal)
    }
    
    let pageIndexView = CustomPageIndexView()
        .setPageCount(count: 3)
    // MARK: - Life Cycles

    // MARK: - UI & Layout
    private func setLayout() {
        self.addSubviews(backButton, pageIndexView)
        
        backButton.snp.makeConstraints {
            $0.leading.equalTo(21)
            $0.top.bottom.equalToSuperview()
            $0.size.equalTo(48)
        }
        
        pageIndexView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    // MARK: - Methods

    // MARK: - Data Source

    // MARK: - Delegate
    weak var delegate: QuizeNavigationProtocol?
    
    // MARK: - Actions
    @objc private func backButtonTap() {
        delegate?.backButtonTap()
    }
    
}
