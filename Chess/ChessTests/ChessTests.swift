//
//  ChessTests.swift
//  ChessTests
//
//  Created by jaeyoung Yun on 2022/10/06.
//

import XCTest

final class ChessTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let main = Main()

        XCTAssertEqual(main.test(), "this is test")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
