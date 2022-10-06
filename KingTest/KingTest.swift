//
//  KingTest.swift
//  KingTest
//
//  Created by 이재은 on 2022/10/06.
//

import XCTest

class KingTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        //        let d = KingProtocol
        let whiteKing = WhiteKing()
        XCTAssertEqual(whiteKing.move(to: (0,2)), true)

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }



}
