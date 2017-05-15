import Foundation

public protocol Model {
    func register(with name: String,
                  completion: @escaping (Error?) -> Void)
}

public class MyModel: Model {
    public func register(with name: String,
                         completion: @escaping (Error?) -> Void) {
        completion(nil)
    }
}

