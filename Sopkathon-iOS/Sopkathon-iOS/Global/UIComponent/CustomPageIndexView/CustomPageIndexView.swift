import UIKit

import SnapKit
import Sopkathon_iOS_Extension
import Then

class CustomPageIndexView: UIStackView {
    // MARK: properties
    init() {
        super.init(frame: .zero)
        self.setConfig()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    // MARK: - UIComponents
    // MARK: - Life Cycles
    // MARK: - UI & Layout
    func setConfig() {
        self.distribution = .fill
        self.spacing = 10
        self.axis = .horizontal
    }
    // MARK: - Methods
    // MARK: - Data Source
    // MARK: - Delegate
    // MARK: - Actions
    func setIndex(selectedIndex: Int) {
        subviews.enumerated().forEach { index, view in
            if let itemView = view as? CustomPageIndexItem {
                itemView.bindState(state: index == selectedIndex)
            }
        }
    }
    
    func setPageCount(count: Int) -> CustomPageIndexView {
        for index in 1 ... count {
            let customItem = CustomPageIndexItem()
            customItem.bindText(title: String(index))
            self.addArrangedSubview(customItem)
            
            customItem.snp.makeConstraints {
                $0.size.equalTo(40)
            }
            customItem.layer.cornerRadius = 20
            customItem.clipsToBounds = true
        }
        setIndex(selectedIndex: 0)
        return self
    }
}

