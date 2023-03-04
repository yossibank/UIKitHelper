public struct ViewStyle<T> {
    let style: (T) -> Void

    public init(style: @escaping (T) -> Void) {
        self.style = style
    }
}

public protocol Stylable {}

extension Stylable {
    func apply(style: ViewStyle<Self>) {
        style.style(self)
    }
}
