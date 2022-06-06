import Constants
import Core
import Extensions
import Resources
import SnapKit
import UIComponents
import UIKit

// MARK: - Constants

private extension ApperanceConstants {
    var backgroundColor: UIColor? { Resources.colors.cF6F0E5() }
    var buttonColor: UIColor? { Resources.colors.c007AFF() }
}

private extension GridConstants {
    var cornerRadius: CGFloat { 14 }
    var multiplerConstraint: CGFloat { 0.7 }
}

private extension DataConstants {
    var showMapButtonTitle: String { Resources.strings.welcomeShowMap() }
}

// MARK: - WelcomeViewInterface

protocol WelcomeViewInterface: BaseViewInterface {}

// MARK: - WelcomeView

class WelcomeView: BaseView<WelcomeViewModelInterface> {
    private lazy var nextButton = MainButton().then {
        $0.setTitle(data.showMapButtonTitle, for: .normal)
        $0.backgroundColor = apperance.buttonColor
        $0.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
    }

    // MARK: -

    override func setupUI() {
        backgroundColor = apperance.backgroundColor
        addSubview(self.nextButton)
    }

    override func setupConstraints() {
        self.nextButton.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }

    // MARK: - Actions

    @objc
    private func nextButtonAction() {
        viewModel.showMapTap()
    }
}

// MARK: - WelcomeViewInterface

extension WelcomeView: WelcomeViewInterface {}
