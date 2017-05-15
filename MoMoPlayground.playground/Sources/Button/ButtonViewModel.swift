import Foundation

public class ButtonViewModel {

    var observer: ((ButtonViewModel) -> Void)?

    let title: String
    var enabled: Bool { didSet { observer?(self) } }
    var hidden: Bool { didSet { observer?(self) } }
    var onTouch: (() -> Void)?

    init(title: String, enabled: Bool = true, hidden: Bool = false) {
        self.title = title
        self.enabled = enabled
        self.hidden = hidden
    }
}
 
