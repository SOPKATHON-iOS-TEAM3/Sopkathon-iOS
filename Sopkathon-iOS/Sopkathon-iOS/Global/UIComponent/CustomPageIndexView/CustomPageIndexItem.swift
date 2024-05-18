import UIKit

import SnapKit
import Sopkathon_iOS_Extension
import Then

final class CustomPageIndexItem: UIView {
    // MARK: properties
    init() {
        super.init(frame: .zero)
        self.setLayout()
        self.setUI()
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
    private func setUI() {
        self.backgroundColor = UIColor(hexCode: "#242424")
    }
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
            self.backgroundColor = UIColor(hexCode: "#242424")
            self.titleLabel.textColor = .white
        } else {
            self.backgroundColor = UIColor(hexCode: "#242424")
            self.titleLabel.textColor = UIColor(hexCode: "#3D3D3D")
        }
    }
    
    func bindText(title: String) {
        titleLabel.text = title
    }
}
