import Constants
import Resources
import UIKit

// MARK: - Constants

private extension GridConstants {
    var cornerRadius: CGFloat { 14 }
}

private extension ApperanceConstants {
    /// Шрифт для titleLabel
    var labelFont: UIFont { Resources.font(type: .black, size: 17) }
    /// Цвет кнопки
    var backgroundColor: UIColor? { Resources.colors.c007AFF() }
}

public final class MainButton: UIButton {
    // MARK: - Variables

    override public var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return .init(width: size.width + grid.space16, height: grid.space56)
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func setup() {
        backgroundColor = apperance.backgroundColor

        clipsToBounds = true
        layer.cornerRadius = grid.cornerRadius

        setTitleColor(apperance.whiteColor, for: .normal)
        titleLabel?.font = apperance.labelFont

        titleEdgeInsets = UIEdgeInsets(
            top: grid.zero,
            left: grid.space8,
            bottom: grid.zero,
            right: grid.space8
        )
    }
}
