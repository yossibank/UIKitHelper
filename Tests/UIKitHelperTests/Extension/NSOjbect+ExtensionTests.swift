import XCTest
@testable import UIKitHelper

final class NSObjectExtensionTests: XCTestCase {
    func test_className() {
        // arrange
        class Test: NSObject {}

        // assert
        XCTAssertEqual(Test.className, "Test")
    }
}
