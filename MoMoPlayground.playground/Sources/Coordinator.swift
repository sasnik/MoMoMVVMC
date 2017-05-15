import UIKit

public protocol Coordinator {
    func start() -> UIViewController
}

public class MyCoordinator: Coordinator {

    private let myModel: Model = MyModel()
    private let vc: UIViewController

    public init() {
        let viewModel = MyViewModel(model: myModel)
        vc = MyViewController(viewModel: viewModel)

        viewModel.coordinator = self
    }

    public func start() -> UIViewController {
        return vc
    }
}

extension MyCoordinator: MyViewModelCoordinatorDelegate {
    public func registeredSuccessfully() {
        /*
         - Take actions
         Notify parent Coordinator
         Do something with vc
         */
    }
}



