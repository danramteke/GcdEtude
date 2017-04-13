import XCTest
@testable import Fetcher

class GcdEtudeTests: XCTestCase {


    func testInitReceivesName() {
        XCTAssertEqual(Fetcher(name: "name").name, "name")
    }
    
    func testReturnsDataWithNameInit() {
            XCTAssertEqual(Fetcher(name: "name").fetch(), "data for name")
    }

    func testCustomStringConvertible() {
      XCTAssertEqual(Fetcher(name: "name").description, "Fetcher(name: name)")
    }

    static var allTests = [
        ("testInitReceivesName", testInitReceivesName),
        ("testReturnsDataWithNameInit", testReturnsDataWithNameInit),
        ("testCustomStringConvertible", testCustomStringConvertible),
    ]
}
