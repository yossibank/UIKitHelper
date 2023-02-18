import UIKit

extension UIColor {
    public static func dynamicColor(
        light: UIColor,
        dark: UIColor
    ) -> UIColor {
        .init { traitCollection -> UIColor in
            traitCollection.userInterfaceStyle == .light ? light : dark
        }
    }
}
