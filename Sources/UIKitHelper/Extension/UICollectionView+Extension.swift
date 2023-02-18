import UIKit

extension UICollectionView {
    public func registerReusableView<T: UICollectionReusableView>(with type: T.Type) {
        register(
            type,
            forSupplementaryViewOfKind: T.className,
            withReuseIdentifier: T.className
        )
    }
}

extension UICollectionView.SupplementaryRegistration {
    public init(handler: @escaping Handler) {
        self.init(
            elementKind: Supplementary.className,
            handler: handler
        )
    }
}
