//
//  SwiftChessTests.swift
//  SwiftChessTests
//
//  Created by Sunghyun Kim on 2022/10/06.
//

import XCTest

final class SwiftChessTests: XCTestCase {
    
    var board = Board()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        board.initPieces()
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
