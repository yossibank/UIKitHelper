import UIKit

extension UIViewController {
    public func addSubviewController(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    public func removeSubviewController(child: UIViewController) {
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }

    public func removeFirstChild() {
        if let firstChild = children.first {
            removeSubviewController(child: firstChild)
        }
    }
}
