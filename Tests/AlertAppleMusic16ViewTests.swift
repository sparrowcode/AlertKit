import XCTest
@testable import AlertKit

class AlertAppleMusic16ViewTests: XCTestCase {

    func testCompletion() {
        let expectation = expectation(description: "")
        
        let view = UIView(frame: .init())
        let alert = AlertAppleMusic16View(title: "title", subtitle: "subtitle", icon: .done)
        alert.present(on: view) {
            expectation.fulfill()
        }
        alert.dismiss()
        
        waitForExpectations(timeout: 10, handler: nil)
    }
}
