import SnapKit
import UIKit

public protocol ViewLayoutable {}

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
}

extension UIView: ViewLayoutable {}

public protocol ViewModifiable: Stylable {}

extension ViewModifiable {
    @discardableResult
    public func modifier<T>(
        _ keyPath: ReferenceWritableKeyPath<Self, T>,
        _ value: T
    ) -> Self {
        self[keyPath: keyPath] = value
        return self
    }

    @discardableResult
    public func configure(_ configuration: (Self) -> Void) -> Self {
        configuration(self)
        return self
    }
}

extension ViewModifiable where Self: UIView {
    @discardableResult
    public func apply(_ style: ViewStyle<Self>) -> Self {
        apply(style: style)
        return self
    }
}

extension ViewModifiable where Self: CALayer {
    @discardableResult
    public func apply(_ style: ViewStyle<Self>) -> Self {
        apply(style: style)
        return self
    }
}

extension UIView: ViewModifiable {}

extension CALayer: ViewModifiable {}

extension UIGestureRecognizer: ViewModifiable {}
