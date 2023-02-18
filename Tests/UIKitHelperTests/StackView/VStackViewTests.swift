import XCTest
@testable import UIKitHelper

final class VStackViewTests: XCTestCase {
    func test_HStackView_axis() {
        // arrange・act
        let stackView = VStackView(builder: {})

        // assert
        XCTAssertEqual(stackView.axis, .vertical)
    }

    func test_VStackView_alignment() {
        // arrange・act
        let stackView1 = VStackView(builder: {})
        let stackView2 = VStackView(alignment: .leading, builder: {})
        let stackView3 = VStackView(alignment: .firstBaseline, builder: {})
        let stackView4 = VStackView(alignment: .center, builder: {})
        let stackView5 = VStackView(alignment: .trailing, builder: {})
        let stackView6 = VStackView(alignment: .lastBaseline, builder: {})
        let stackView7 = VStackView(alignment: .top, builder: {})
        let stackView8 = VStackView(alignment: .bottom, builder: {})

        // assert
        XCTAssertEqual(stackView1.alignment, .fill)
        XCTAssertEqual(stackView2.alignment, .leading)
        XCTAssertEqual(stackView3.alignment, .firstBaseline)
        XCTAssertEqual(stackView4.alignment, .center)
        XCTAssertEqual(stackView5.alignment, .trailing)
        XCTAssertEqual(stackView6.alignment, .lastBaseline)
        XCTAssertEqual(stackView7.alignment, .top)
        XCTAssertEqual(stackView8.alignment, .bottom)
    }

    func test_VStackView_distribution() {
        // arrange・act
        let stackView1 = VStackView(builder: {})
        let stackView2 = VStackView(distribution: .fillEqually, builder: {})
        let stackView3 = VStackView(distribution: .fillProportionally, builder: {})
        let stackView4 = VStackView(distribution: .equalSpacing, builder: {})
        let stackView5 = VStackView(distribution: .equalCentering, builder: {})

        // assert
        XCTAssertEqual(stackView1.distribution, .fill)
        XCTAssertEqual(stackView2.distribution, .fillEqually)
        XCTAssertEqual(stackView3.distribution, .fillProportionally)
        XCTAssertEqual(stackView4.distribution, .equalSpacing)
        XCTAssertEqual(stackView5.distribution, .equalCentering)
    }

    func test_VStackView_spacing() {
        // arrange・act
        let stackView1 = HStackView(builder: {})
        let stackView2 = HStackView(spacing: 10, builder: {})
        let stackView3 = HStackView(spacing: 100, builder: {})

        // assert
        XCTAssertEqual(stackView1.spacing, 0)
        XCTAssertEqual(stackView2.spacing, 10)
        XCTAssertEqual(stackView3.spacing, 100)
    }

    func test_HStackView_layoutMargins() {
        // arrange・act
        let stackView1 = VStackView(builder: {})
        let stackView2 = VStackView(layoutMargins: .init(top: 10, left: 10, bottom: 10, right: 10), builder: {})
        let stackView3 = VStackView(layoutMargins: .init(top: 100, left: 100, bottom: 100, right: 100), builder: {})

        // assert
        XCTAssertEqual(stackView1.layoutMargins, .zero)
        XCTAssertEqual(stackView2.layoutMargins, .init(top: 10, left: 10, bottom: 10, right: 10))
        XCTAssertEqual(stackView3.layoutMargins, .init(top: 100, left: 100, bottom: 100, right: 100))
    }

    func test_VStackView_isLayoutMarginsRelativeArrangement() {
        // arrange・act
        let stackView = VStackView(builder: {})

        // assert
        XCTAssertEqual(stackView.isLayoutMarginsRelativeArrangement, true)
    }

    func test_VStackView_stackViewBuilder() {
        // arrange
        let view1 = UIView()
        let view2 = UIView()
        let view3 = UIView()

        // act
        let stackView = VStackView {
            view1
            view2
            view3
        }

        // assert
        XCTAssertEqual(stackView.arrangedSubviews, [view1, view2, view3])
    }
}
