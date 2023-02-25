import UIKit

extension UIEdgeInsets {
    public enum EdgeInsetsDirection {
        case top
        case left
        case bottom
        case right
        case horizontal
        case vertical
    }

    public init(
        _ direction: EdgeInsetsDirection,
        _ padding: CGFloat
    ) {
        switch direction {
        case .top:
            self.init(
                top: padding,
                left: .zero,
                bottom: .zero,
                right: .zero
            )

        case .bottom:
            self.init(
                top: .zero,
                left: .zero,
                bottom: padding,
                right: .zero
            )

        case .left:
            self.init(
                top: .zero,
                left: padding,
                bottom: .zero,
                right: .zero
            )

        case .right:
            self.init(
                top: .zero,
                left: .zero,
                bottom: .zero,
                right: padding
            )

        case .horizontal:
            self.init(
                top: .zero,
                left: padding,
                bottom: .zero,
                right: padding
            )

        case .vertical:
            self.init(
                top: padding,
                left: .zero,
                bottom: padding,
                right: .zero
            )
        }
    }

    public init(_ directions: [EdgeInsetsDirection], _ padding: CGFloat) {
        var insets: UIEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0)

        directions.forEach {
            switch $0 {
            case .top:
                insets.top = padding

            case .left:
                insets.left = padding

            case .bottom:
                insets.bottom = padding

            case .right:
                insets.right = padding

            case .horizontal:
                insets.left = padding
                insets.right = padding

            case .vertical:
                insets.top = padding
                insets.bottom = padding
            }
        }

        self.init(
            top: insets.top,
            left: insets.left,
            bottom: insets.bottom,
            right: insets.right
        )
    }
}
