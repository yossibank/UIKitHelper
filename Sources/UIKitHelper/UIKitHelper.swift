import SnapKit
import UIKit

public struct ViewStyle<T> {
    let style: (T) -> Void

    public init(style: @escaping (T) -> Void) {
        self.style = style
    }
}

public protocol Stylable {}

extension Stylable {
    fileprivate func apply(style: ViewStyle<Self>) {
        style.style(self)
    }
}

public protocol ViewLayoutable: Stylable {}

extension ViewLayoutable where Self: UIView {
    @discardableResult
    public func addSubview<T: UIView>(
        _ child: T,
        _ configuration: ((ConstraintMaker) -> Void)
    ) -> Self {
        addSubview(child)
        child.snp.makeConstraints(configuration)
        return self
    }

    @discardableResult
    public func addConstraint(_ configuration: (ConstraintMaker) -> Void) -> Self {
        snp.makeConstraints(configuration)
        return self
    }

    @discardableResult
    public func modifier<T>(
        _ keyPath: ReferenceWritableKeyPath<Self, T>,
        _ value: T
    ) -> Self {
        self[keyPath: keyPath] = value
        return self
    }

    @discardableResult
    public func apply(_ style: ViewStyle<Self>) -> Self {
        apply(style: style)
        return self
    }

    @discardableResult
    public func configure(_ configuration: (Self) -> Void) -> Self {
        configuration(self)
        return self
    }
}

extension UIView: ViewLayoutable {}
