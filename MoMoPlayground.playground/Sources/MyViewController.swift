import UIKit

public class MyViewController: UIViewController {

    private let viewModel: MyViewModel

    private let btn = UIButton(type: .system)
    private let tf = UITextField(frame: .zero)

    init(viewModel: MyViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)

        tf.addTarget(self, action: #selector(textDidChange(tf:)),
                     for: .editingChanged)
        btn.addTarget(self, action: #selector(buttonTapped(btn:)),
                      for: .touchUpInside)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        
        tf.borderStyle = .roundedRect
        tf.addTarget(self, action: #selector(textDidChange(tf:)),
                     for: .editingChanged)
        view.addSubview(tf)
        
        btn.isEnabled = viewModel.isValidText
        btn.setTitle("Go", for: .normal)
        btn.addTarget(self, action: #selector(buttonTapped(btn:)),
                      for: .touchUpInside)
        view.addSubview(btn)
    }

    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tf.frame.size = CGSize(width: view.frame.width - 50, height: 44)
        tf.center = view.center

        btn.sizeToFit()
        btn.center = .init(x: view.center.x, y: view.center.y + 50)
    }

    @objc private func textDidChange(tf: UITextField) {
        viewModel.changed(text: tf.text ?? "")
        btn.isEnabled = viewModel.isValidText
    }

    @objc private func buttonTapped(btn: UIButton) {
        viewModel.goNext()
    }
}

