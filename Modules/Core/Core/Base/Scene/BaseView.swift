import Constants
import Core
import UIKit

// MARK: - Constants

private extension GridConstants {}

private extension DataConstants {}

private extension ApperanceConstants {}

// MARK: - BaseViewInterface

public protocol BaseViewInterface: ViewInterface {}

// MARK: - BaseViewProtocol

protocol BaseViewProtocol {
    func viewWillAppear()
    func viewWillDisappear()
    func viewLoaded()
    func setup()
    func setupUI()
    func setupConstraints()
}

// MARK: - BaseViewController

open class BaseView<ViewModel>: UIView {
    public var viewModel: ViewModel!

    open func viewWillAppear() {}

    open func viewWillDisappear() {}

    open func viewLoaded() {}

    open func setup() {}

    open func setupUI() {}

    open func setupConstraints() {}
}

// MARK: - BaseViewInterface

extension BaseView: BaseViewInterface {}

// MARK: - BaseViewProtocol

extension BaseView: BaseViewProtocol {}
