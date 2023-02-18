import Combine
import UIKit

extension UITextField {
    public var textDidChangePublisher: AnyPublisher<String, Never> {
        NotificationCenter
            .default
            .publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap { $0.object as? UITextField }
            .compactMap(\.text)
            .removeDuplicates()
            .eraseToAnyPublisher()
    }
}
