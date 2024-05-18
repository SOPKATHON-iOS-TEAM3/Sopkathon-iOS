import UIKit

import SnapKit
import Sopkathon_iOS_Extension
import Then


class CreateQuizResultViewController: UIViewController {
    // MARK: properties
    // MARK: - UIComponents
    private let createQuizResultView = CreateQuizResultView()
    // MARK: - Life Cycles
    override func loadView() {
        super.loadView()
        self.view = createQuizResultView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - UI & Layout
    // MARK: - Methods
    private func bindGesture() {
        let gesture = UITapGestureRecognizer(target: self,
                                             action: #selector(codeViewTapped(_:)))
        createQuizResultView.copyCodeView.addGestureRecognizer(gesture)
    }
    
    @objc private func codeViewTapped(_ sender: UITapGestureRecognizer) {
//        UIPasteboard.general.string = createQuizResultView.copyCodeView
        
    }
    // MARK: - Data Source
    // MARK: - Delegate
    // MARK: - Actions

}
