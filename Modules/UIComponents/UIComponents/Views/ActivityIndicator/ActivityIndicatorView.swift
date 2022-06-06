import Constants
import Foundation
import NVActivityIndicatorView
import Resources
import SnapKit
import Then

// MARK: - ActivityIndicatorView

public class ActivityIndicatorView: UIView {
    private lazy var activityIndicatorView: UIView = NVActivityIndicatorView(
        frame: .zero,
        type: .ballScaleRippleMultiple,
        color: Resources.colors.c007AFF()
    ).then {
        $0.startAnimating()
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)

        self.setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        addSubview(self.activityIndicatorView)
        self.activityIndicatorView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
