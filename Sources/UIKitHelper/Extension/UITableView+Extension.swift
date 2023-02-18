import UIKit

extension UITableView {
    public func registerCell(with type: UITableViewCell.Type) {
        register(
            type,
            forCellReuseIdentifier: String(describing: type)
        )
    }

    public func registerCells(with types: [UITableViewCell.Type]) {
        types.forEach {
            registerCell(with: $0)
        }
    }

    public func registerHeaderFooterView(with type: UITableViewHeaderFooterView.Type) {
        register(
            type,
            forHeaderFooterViewReuseIdentifier: String(describing: type)
        )
    }

    public func registerHeaderFooterViews(with types: [UITableViewHeaderFooterView.Type]) {
        types.forEach {
            registerHeaderFooterView(with: $0)
        }
    }

    public func dequeueReusableCell<T: UITableViewCell>(
        withType type: T.Type,
        for indexPath: IndexPath
    ) -> T {
        dequeueReusableCell(
            withIdentifier: String(describing: type),
            for: indexPath
        ) as! T
    }

    public func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(
        withType type: T.Type
    ) -> T {
        dequeueReusableHeaderFooterView(
            withIdentifier: String(describing: type)
        ) as! T
    }
}
