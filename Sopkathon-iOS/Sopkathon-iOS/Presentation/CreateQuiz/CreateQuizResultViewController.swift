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
        bindGesture()
        createQuizResultView.copyCodeView.codeLabel.text = UserDefaults.standard.string(forKey: "code")
    }
    // MARK: - UI & Layout
    // MARK: - Methods
    private func bindGesture() {
        let gesture = UITapGestureRecognizer(target: self,
                                             action: #selector(codeViewTapped(_:)))
        createQuizResultView.copyCodeView.addGestureRecognizer(gesture)
        
        createQuizResultView.button.addTarget(self,
                                              action: #selector(homeButtonTap),
                                              for: .touchUpInside)
    }
    
    @objc private func homeButtonTap() {
        self.navigationController?.viewControllers.forEach {
            if let homeVC = $0 as? HomeViewController {
                self.navigationController?.popToViewController(homeVC, animated: true)
            }
        }
    }
    
    @objc private func codeViewTapped(_ sender: UITapGestureRecognizer) {
        UIPasteboard.general.string = UserDefaults.standard.string(forKey: "code")
        bindAnimation()
        
    }
    
    private func bindAnimation() {
        UIView.animate(withDuration: 2.0) {
            self.createQuizResultView.toastView.isHidden = false
            self.createQuizResultView.toastView.alpha = 0.0
        } completion: { _ in
            self.createQuizResultView.toastView.isHidden = true
            self.createQuizResultView.toastView.alpha = 1.0
        }
    }


    // MARK: - Data Source
    // MARK: - Delegate
    // MARK: - Actions

}
