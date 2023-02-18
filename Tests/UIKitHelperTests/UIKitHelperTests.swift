import XCTest
@testable import UIKitHelper

final class UIKitHelperTests: XCTestCase {
    func test_viewLayoutable_addSubview() {
        // arrange
        let parentView = UIView()
        parentView.backgroundColor = .red

        let childView = UIView()
        childView.backgroundColor = .blue

        // act
        parentView.addSubview(childView)

        // assert
        XCTAssertTrue(parentView.subviews.contains(childView))
    }

    func test_viewLayoutable_modifier() {
        // arrange
        let label = UILabel()

        // act
        label.modifier(\.text, "label")
        label.modifier(\.backgroundColor, .red)

        // assert
        XCTAssertEqual(label.text, "label")
        XCTAssertEqual(label.backgroundColor, .red)
    }

    func test_viewLayoutable_apply() {
        // arrange
        let label = UILabel()
        let labelStyle = ViewStyle<UILabel> {
            $0.text = "label"
            $0.backgroundColor = .red
        }

        // act
        label.apply(labelStyle)

        // assert
        XCTAssertEqual(label.text, "label")
        XCTAssertEqual(label.backgroundColor, .red)
    }

    func test_viewLayoutable_configure() {
        // arrange
        let button = UIButton()

        // act
        button.configure {
            $0.setTitle("button", for: .normal)
            $0.setTitleColor(.red, for: .normal)
        }

        // assert
        XCTAssertEqual(button.title(for: .normal), "button")
        XCTAssertEqual(button.titleColor(for: .normal), .red)
    }
}
