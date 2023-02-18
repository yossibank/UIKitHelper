import UIKit

@resultBuilder
public enum StackViewBuilder {
    public static func buildBlock(_ views: UIView...) -> [UIView] {
        views
    }

    public static func buildBlock(_ view: UIView) -> UIView {
        view
    }
}
