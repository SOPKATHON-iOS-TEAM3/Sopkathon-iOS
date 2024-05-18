import UIKit

class PaddingLabel: UILabel {
    // MARK: properties
    private var padding = UIEdgeInsets(top: 0, left: 5.0, bottom: 0, right: 0)
    convenience init(padding: UIEdgeInsets) {
        self.init()
        self.padding = padding
    }
    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += padding.top + padding.bottom
        contentSize.width += padding.left + padding.right

        return contentSize
    }
    // MARK: - UIComponents
    // MARK: - Life Cycles
    // MARK: - UI & Layout
    // MARK: - Methods
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }
    // MARK: - Data Source
    // MARK: - Delegate
    // MARK: - Actions
}
