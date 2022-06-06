import Constants
import Core
import Extensions
import Resources
import SnapKit
import UIComponents
import UIKit

// MARK: - Constants

private extension DataConstants {
    var errorTitle: String { Resources.strings.commonError() }
    var successTitle: String { Resources.strings.successTitle() }
}

private extension ApperanceConstants {
    var backgroundColor: UIColor? { Resources.colors.cF6F0E5() }
}

// MARK: - BaseViewControllerInterface

public protocol BaseViewControllerInterface: ViewControllerInterface, BaseViewControllerProtocol {
    func showMessage(title: String, message: String)
    func showError(_ errorMessage: String)
}

// MARK: - BaseViewControllerProtocol

public protocol BaseViewControllerProtocol {
    func showHud()
    func hideHud()
}

// MARK: - BaseViewController

open class BaseViewController<View, ViewModel>: UIViewController {
    public var contentView: View!
    public var viewModel: ViewModel!

    public lazy var activityIndicatorView: UIView = ActivityIndicatorView(frame: .zero).then {
        $0.snp.makeConstraints {
            $0.size.equalTo(grid.space24)
        }
    }

    override open func viewDidLoad() {
        super.viewDidLoad()

        (self.contentView as? BaseViewProtocol)?.viewLoaded()
        (self.viewModel as? BaseViewModelProtocol)?.viewLoaded()

        self.setup()
        self.setupUI()
        self.setupConstraints()
    }

    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        (self.contentView as? BaseViewProtocol)?.viewWillAppear()
        (self.viewModel as? BaseViewModelProtocol)?.viewAppeared()
    }

    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        (self.contentView as? BaseViewProtocol)?.viewWillDisappear()
    }

    open func showHud() {
        view.addSubview(self.activityIndicatorView)
        self.activityIndicatorView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }

    open func hideHud() {
        self.activityIndicatorView.removeFromSuperview()
    }

    open func setup() {
        view.backgroundColor = apperance.backgroundColor
        (self.contentView as? BaseViewProtocol)?.setup()
    }

    public func pinContent() {
        if let contentView = contentView as? UIView {
            contentView.frame = view.frame
            view.addSubview(contentView)

            contentView.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
        }
    }

    open func setupUI() {
        (self.contentView as? BaseViewProtocol)?.setupUI()
    }

    open func setupConstraints() {
        (self.contentView as? BaseViewProtocol)?.setupConstraints()
    }

    // MARK: - Actions

    @objc
    open func hideKeyboard() {
        view.endEditing(true)
    }

    // MARK: -

    open func showMessage(title: String, message: String) {
        alert(title, message: message)
    }

    open func showError(_ errorMessage: String) {
        alert(data.errorTitle, message: errorMessage)
    }
}

// MARK: - BaseViewControllerProtocol

extension BaseViewController: BaseViewControllerProtocol {}

// MARK: - BaseViewControllerInterface

extension BaseViewController: BaseViewControllerInterface {}
