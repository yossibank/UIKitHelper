import Combine
import UIKit

extension UIBarButtonItem {
    public final class Subscription<
        SubscriberType: Subscriber,
        Input: UIBarButtonItem
    >: Combine.Subscription where SubscriberType.Input == Input {
        private var subscriber: SubscriberType?

        private let input: Input

        init(
            subscriber: SubscriberType,
            input: Input
        ) {
            self.subscriber = subscriber
            self.input = input

            input.target = self
            input.action = #selector(eventHandler)
        }

        public func request(_ demand: Subscribers.Demand) {}

        public func cancel() {
            subscriber = nil
        }

        @objc private func eventHandler() {
            _ = subscriber?.receive(input)
        }
    }

    public struct Publisher<Output: UIBarButtonItem>: Combine.Publisher {
        public typealias Output = Output
        public typealias Failure = Never

        public let output: Output

        init(output: Output) {
            self.output = output
        }

        public func receive<S>(
            subscriber: S
        ) where S: Subscriber, Never == S.Failure, Output == S.Input {
            let subscription = Subscription(
                subscriber: subscriber,
                input: output
            )

            subscriber.receive(subscription: subscription)
        }
    }
}
