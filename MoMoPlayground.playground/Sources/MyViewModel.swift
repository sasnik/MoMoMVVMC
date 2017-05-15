import Foundation

public protocol MyViewModelCoordinatorDelegate: class {
    func registeredSuccessfully()
}

public protocol MyViewModelViewDelegate: class {
    func presentError(message: String)
}

public class MyViewModel {

    weak var coordinator: MyViewModelCoordinatorDelegate?
    weak var view: MyViewModelViewDelegate?

    var isValidText: Bool { return !text.isEmpty }
    private var text: String = ""

    private let model: Model

    init(model: Model) {
        self.model = model
    }

    func changed(text: String) {
        self.text = text
    }

    func goNext() {
        if !isValidText { return }
        model.register(with: text) { [weak self] error in
            self?.handleResult(with: error)
        }
    }

    private func handleResult(with error: Error?) {
        error == nil
            ? coordinator?.registeredSuccessfully()
            : view?.presentError(message: "Someting went wrong...")
    }
}


