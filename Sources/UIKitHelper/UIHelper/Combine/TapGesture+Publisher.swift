import Combine
import UIKit

extension UIView {
    public enum GestureType {
        case tap(UITapGestureRecognizer = .init())
        case swipe(UISwipeGestureRecognizer = .init())
        case longPress(UILongPressGestureRecognizer = .init(), TimeInterval = 0)
        case pan(UIPanGestureRecognizer = .init())
        case pinch(UIPinchGestureRecognizer = .init())
        case edge(UIScreenEdgePanGestureRecognizer = .init())

        public func get() -> UIGestureRecognizer {
            switch self {
            case let .tap(tapGesture):
                return tapGesture

            case let .swipe(swipeGesture):
                return swipeGesture

            case let .longPress(longPressGesture, time):
                longPressGesture.minimumPressDuration = time
                return longPressGesture

            case let .pan(panGesture):
                return panGesture

            case let .pinch(pinchGesture):
                return pinchGesture

            case let .edge(edgePanGesture):
                return edgePanGesture
            }
        }
    }

    public final class GestureSubscription<
        S: Subscriber
    >: Subscription where S.Input == GestureType, S.Failure == Never {
        private var subscriber: S?
        private var gestureType: GestureType
        private var view: UIView

        init(
            subscriber: S,
            gestureType: GestureType,
            view: UIView
        ) {
            self.subscriber = subscriber
            self.gestureType = gestureType
            self.view = view

            configureGesture(gestureType)
        }

        public func request(_ demand: Subscribers.Demand) {}

        public func cancel() {
            subscriber = nil
        }

        private func configureGesture(_ gestureType: GestureType) {
            let gesture = gestureType.get()

            gesture.addTarget(
                self,
                action: #selector(eventHandler)
            )

            view.addGestureRecognizer(gesture)
        }

        @objc private func eventHandler() {
            _ = subscriber?.receive(gestureType)
        }
    }

    public struct GesturePublisher: Publisher {
        public typealias Output = GestureType
        public typealias Failure = Never

        private let gestureType: GestureType
        private let view: UIView

        init(
            gestureType: GestureType,
            view: UIView
        ) {
            self.gestureType = gestureType
            self.view = view
        }

        public func receive<S>(
            subscriber: S
        ) where S: Subscriber, Never == S.Failure, UIView.GestureType == S.Input {
            let subscription = GestureSubscription(
                subscriber: subscriber,
                gestureType: gestureType,
                view: view
            )

            subscriber.receive(subscription: subscription)
        }
    }
}

extension UIView {
    public func gesturePublisher(_ gestureType: GestureType = .tap()) -> GesturePublisher {
        isUserInteractionEnabled = true

        return .init(
            gestureType: gestureType,
            view: self
        )
    }
}
