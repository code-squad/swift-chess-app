//
//  SwiftChessAppTests.swift
//  SwiftChessAppTests
//
//  Created by YoungsunMoon on 2022/09/26.
//

import XCTest
@testable import SwiftChessApp

class BoardTests: XCTestCase {
    
    private var board: Board!
    private var rankManager: RankManager!
    
    override func setUp() {
        super.setUp()
        board = BoardImpl(rankManager: RankManagerImpl(whiteRanks: [1, 2], blackRanks: [7, 8]))
    }
    
    // Board는 현재 있는 말을 확인해서 흑과 백 점수를 출력한다.
    func testBoardScore() {
        board.score { whiteScore, blackScore in
            XCTAssertEqual(whiteScore, 16)
            XCTAssertEqual(blackScore, 16)
        }
    }
    
    // Board는 rank 문자열 배열로 보드 위에 체스말을 리턴한다.
    func testRankManagerDisplay() {
        let expect = ["♙♙♙♙♙♙♙♙",
                      "♙♙♙♙♙♙♙♙",
                      "........",
                      "........",
                      "........",
                      "........",
                      "♟♟♟♟♟♟♟♟",
                      "♟♟♟♟♟♟♟♟"]
        XCTAssertEqual(board.display(), expect)
    }
    
    // Board는 특정 말을 옮기는 메소드는 Board에서 제공한다.
    func testMove() { }
}
