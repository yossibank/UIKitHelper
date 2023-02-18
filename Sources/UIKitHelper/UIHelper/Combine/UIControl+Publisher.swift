import Combine
import UIKit

extension UIControl {
    public final class Subscription<
        SubscriberType: Subscriber,
        Control: UIControl
    >: Combine.Subscription where SubscriberType.Input == Control {
        private var subscriber: SubscriberType?

        private let input: Control

        init(
            subscriber: SubscriberType,
            input: Control,
            event: UIControl.Event
        ) {
            self.subscriber = subscriber
            self.input = input

            input.addTarget(
                self,
                action: #selector(eventHandler),
                for: event
            )
        }

        public func request(_ demand: Subscribers.Demand) {}

        public func cancel() {
            subscriber = nil
        }

        @objc private func eventHandler() {
            _ = subscriber?.receive(input)
        }
    }

    public struct Publisher<Output: UIControl>: Combine.Publisher {
        public typealias Output = Output
        public typealias Failure = Never

        private let output: Output
        private let controlEvents: UIControl.Event

        init(
            output: Output,
            controlEvents: UIControl.Event
        ) {
            self.output = output
            self.controlEvents = controlEvents
        }

        public func receive<S>(
            subscriber: S
        ) where S: Subscriber, Never == S.Failure, Output == S.Input {
            let subscription = Subscription(
                subscriber: subscriber,
                input: output,
                event: controlEvents
            )

            subscriber.receive(subscription: subscription)
        }
    }
}
