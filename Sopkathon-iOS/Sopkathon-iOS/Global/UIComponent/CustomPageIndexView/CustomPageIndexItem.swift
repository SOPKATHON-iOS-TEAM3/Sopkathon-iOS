import UIKit

import SnapKit
import Sopkathon_iOS_Extension
import Then

final class CustomPageIndexItem: UIView {
    // MARK: properties
    init() {
        super.init(frame: .zero)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    // MARK: - UIComponents
    private let titleLabel = UILabel().then {
        $0.textAlignment = .center
    }
    // MARK: - Life Cycles
    // MARK: - UI & Layout
    private func setLayout() {
        self.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    // MARK: - Data Source
    // MARK: - Delegate
    // MARK: - Actions
    func bindState(state: Bool) {
        if state {
            self.backgroundColor = .black
            self.titleLabel.textColor = .white
        } else {
            self.backgroundColor = .white
            self.titleLabel.textColor = .black
        }
    }
    
    func bindText(title: String) {
        titleLabel.text = title
    }
}
