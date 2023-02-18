import UIKit

public final class VStackView: BaseStackView {
    public init(
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill,
        spacing: CGFloat = 0,
        layoutMargins: UIEdgeInsets = .zero,
        @StackViewBuilder builder: () -> [UIView]
    ) {
        super.init(
            axis: .vertical,
            alignment: alignment,
            distribution: distribution,
            spacing: spacing,
            layoutMargins: layoutMargins,
            arrangedSubviews: builder()
        )
    }

    public init(
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill,
        spacing: CGFloat = 0,
        layoutMargins: UIEdgeInsets = .zero,
        @StackViewBuilder builder: () -> UIView
    ) {
        super.init(
            axis: .vertical,
            alignment: alignment,
            distribution: distribution,
            spacing: spacing,
            layoutMargins: layoutMargins,
            arrangedSubviews: [builder()]
        )
    }

    public required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}
