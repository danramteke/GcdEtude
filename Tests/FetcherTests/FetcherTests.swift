import XCTest
@testable import Fetcher

class GcdEtudeTests: XCTestCase {


    func testInitReceivesName() {
        XCTAssertEqual(Fetcher(name: "name").name, "name")
    }
    
    func testReturnsDataWithNameInit() {
            XCTAssertEqual(Fetcher(name: "name").fetch(), ["name": "data for name"])
    }

    static var allTests = [
        ("testInitReceivesName", testInitReceivesName),
        ("testReturnsDataWithNameInit", testReturnsDataWithNameInit)
    ]
}
