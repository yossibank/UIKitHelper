import XCTest
@testable import UIKitHelper

final class UIEdgeInsetsExtensionTests: XCTestCase {
    func test_init_direction_top() {
        // arrange
        let insets = UIEdgeInsets(.top, 10)

        // assert
        XCTAssertEqual(insets.top, 10)
    }

    func test_init_direction_left() {
        // arrange
        let insets = UIEdgeInsets(.left, 10)

        // assert
        XCTAssertEqual(insets.left, 10)
    }

    func test_init_direction_bottom() {
        // arrange
        let insets = UIEdgeInsets(.bottom, 10)

        // assert
        XCTAssertEqual(insets.bottom, 10)
    }

    func test_init_direction_right() {
        // arrange
        let insets = UIEdgeInsets(.right, 10)

        // assert
        XCTAssertEqual(insets.right, 10)
    }

    func test_init_direction_horizontal() {
        // arrange
        let insets = UIEdgeInsets(.horizontal, 10)

        // assert
        XCTAssertEqual(insets.left, 10)
        XCTAssertEqual(insets.right, 10)
    }

    func test_init_direction_vertical() {
        // arrange
        let insets = UIEdgeInsets(.vertical, 10)

        // assert
        XCTAssertEqual(insets.top, 10)
        XCTAssertEqual(insets.bottom, 10)
    }

    func test_init_directions() {
        // arrange
        let insets1 = UIEdgeInsets([.top, .left], 10)

        // assert
        XCTAssertEqual(insets1.top, 10)
        XCTAssertEqual(insets1.left, 10)

        // arrange
        let insets2 = UIEdgeInsets([.top, .right], 10)

        // assert
        XCTAssertEqual(insets2.top, 10)
        XCTAssertEqual(insets2.right, 10)

        // arrange
        let insets3 = UIEdgeInsets([.bottom, .right], 10)

        // assert
        XCTAssertEqual(insets3.bottom, 10)
        XCTAssertEqual(insets3.right, 10)

        // arrange
        let insets4 = UIEdgeInsets([.top, .horizontal], 10)

        // assert
        XCTAssertEqual(insets4.top, 10)
        XCTAssertEqual(insets4.left, 10)
        XCTAssertEqual(insets4.right, 10)
    }
}
