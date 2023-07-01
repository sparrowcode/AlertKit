import XCTest
@testable import AlertKit

class AlertAppleMusic17ViewTests: XCTestCase {

    func testCompletion() {
        let expectation = expectation(description: "")
        
        let view = UIView(frame: .init())
        let alert = AlertAppleMusic17View(title: "title", subtitle: "subtitle", icon: .done)
        alert.present(on: view) {
            expectation.fulfill()
        }
        alert.dismiss()
        
        waitForExpectations(timeout: 10, handler: nil)
    }
}
