import Constants
import Core
import Extensions
import Resources
import SnapKit
import UIKit

// MARK: - Constants

private extension GridConstants {}

private extension DataConstants {
    var titleText: String { Resources.strings.splashTitle() }
}

private extension ApperanceConstants {
    var titleFont: UIFont { Resources.font(type: .medium, size: 30) }
    var titleColor: UIColor? { Resources.colors.c8E8E93() }

    var backgroundColor: UIColor? { Resources.colors.cF6F0E5() }
}

// MARK: - SplashViewInterface

public protocol SplashViewInterface: BaseViewInterface {}

// MARK: - SplashView

class SplashView: BaseView<SplashViewModel> {
    private lazy var titleTextLabel = UILabel().then {
        $0.textColor = apperance.titleColor
        $0.numberOfLines = .zero
        $0.sizeToFit()
        $0.font = apperance.titleFont
        $0.text = data.titleText.uppercased()
    }

    override func setupUI() {
        backgroundColor = apperance.backgroundColor
        addSubview(self.titleTextLabel)
    }

    override func setupConstraints() {
        self.titleTextLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}

// MARK: - SplashViewInterface

extension SplashView: SplashViewInterface {}
