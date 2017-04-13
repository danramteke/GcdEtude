import XCTest
@testable import Fetcher

class GcdEtudeTests: XCTestCase {


    func testInitReceivesName() {
        XCTAssertEqual(BasicFetcher(name: "name").name, "name")
    }
    
    func testReturnsDataWithNameInit() {
            XCTAssertEqual(BasicFetcher(name: "name").fetch(), ["name": "data for name"])
    }

    static var allTests = [
        ("testInitReceivesName", testInitReceivesName),
        ("testReturnsDataWithNameInit", testReturnsDataWithNameInit)
    ]
}
