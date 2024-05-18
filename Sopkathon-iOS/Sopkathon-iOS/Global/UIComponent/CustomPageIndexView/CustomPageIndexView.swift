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
    func setIndex(offsetX: CGFloat) {
        if offsetX >= 0 {
            let selectedIndex = max(ceil(((UIScreen.main.bounds.width / 2.0) + offsetX) / UIScreen.main.bounds.width) - 1, 0)
            subviews.enumerated().forEach { index, view in
                if let itemView = view as? CustomPageIndexItem {
                    itemView.bindState(state: index == Int(selectedIndex))
                }
            }
        }
    }
    
    func setIndex(selectedIndex: Int) {
        subviews.enumerated().forEach { index, view in
            if let itemView = view as? CustomPageIndexItem {
                itemView.bindState(state: index == Int(selectedIndex))
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
        setIndex(offsetX: 0)
        return self
    }
}

