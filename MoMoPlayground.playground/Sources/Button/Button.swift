import UIKit

public class Button: UIButton {

    private let viewModel: ButtonViewModel

    public init(viewModel: ButtonViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)

        setTitle(viewModel.title, for: .normal)
        isEnabled = viewModel.enabled
        viewModel.observer = { [weak self] vm in
            self?.isEnabled = vm.enabled
            self?.isHidden = vm.hidden
        }
        addTarget(self, action: #selector(tapped),
                  for: .touchUpInside)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func tapped() {
        viewModel.onTouch?()
    }
}

