//
//  ChessAppTests.swift
//  ChessAppTests
//
//  Created by seongmin.kim on 2022/09/27.
//

import XCTest
@testable import ChessApp

final class ChessAppTests: XCTestCase {
    
    let board = Board()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_보드생성() throws {
        let result = """
 ABCDEFGH
1........
2♟♟♟♟♟♟♟♟
3........
4........
5........
6........
7♙♙♙♙♙♙♙♙
8........
 ABCDEFGH
"""
        board.startGame()
        XCTAssertEqual(board.displayBoard(), result)
    }
    
    func test_시작시_점수_출력() throws {
        let result = "현재 스코어\nblack -> 0\nwhite -> 0"
        board.startGame()
        XCTAssertEqual(board.score(), result)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
