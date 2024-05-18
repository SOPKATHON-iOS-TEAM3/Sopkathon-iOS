import UIKit

import SnapKit
import Sopkathon_iOS_Extension
import Then

class QuizNavigationView: UIView {
    weak var delegate: QuizeNavigationProtocol?
    
    init() {
        super.init(frame: .zero)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc private func backButtonTap() {
        delegate?.backButtonTap()
    }
    
    private func setLayout() {
        self.addSubviews(backButton, pageIndexView)
        
        backButton.snp.makeConstraints {
            $0.leading.equalTo(21)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(48)
        }
        
        pageIndexView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    lazy var backButton = UIButton().then {
        $0.addTarget(self,
                     action: #selector(backButtonTap),
                     for: .touchUpInside)
        $0.setImage(.checkmark, for: .normal)
    }
    
    let pageIndexView = CustomPageIndexView()
        .setPageCount(count: 3)
    
}
