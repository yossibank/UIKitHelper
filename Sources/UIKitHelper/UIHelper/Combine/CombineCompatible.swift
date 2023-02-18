import Combine
import UIKit

public protocol CombineCompatible {}

extension UIControl: CombineCompatible {}

extension UIBarButtonItem: CombineCompatible {}

extension CombineCompatible where Self: UIControl {
    public func publisher(for events: UIControl.Event) -> UIControl.Publisher<Self> {
        .init(
            output: self,
            controlEvents: events
        )
    }
}

extension CombineCompatible where Self: UIBarButtonItem {
    public var publisher: UIBarButtonItem.Publisher<Self> {
        .init(output: self)
    }
}

extension CombineCompatible where Self: UIDatePicker {
    public var publisher: AnyPublisher<Date, Never> {
        publisher(for: [.valueChanged])
            .map(\.date)
            .eraseToAnyPublisher()
    }
}

extension CombineCompatible where Self: UISwitch {
    public var isOnPublisher: AnyPublisher<Bool, Never> {
        publisher(for: [.allEditingEvents, .valueChanged])
            .map(\.isOn)
            .eraseToAnyPublisher()
    }
}

extension CombineCompatible where Self: UISegmentedControl {
    public var selectedIndexPublisher: AnyPublisher<Int, Never> {
        publisher(for: [.allEditingEvents, .valueChanged])
            .map(\.selectedSegmentIndex)
            .eraseToAnyPublisher()
    }
}
