//
//  RankManagerTests.swift
//  SwiftChessAppTests
//
//  Created by YoungsunMoon on 2022/09/29.
//

import XCTest
@testable import SwiftChessApp

final class RankManagerTests: XCTestCase {

    func testScore() {
        let rankManager: RankManager = RankManagerImpl(whiteRanks: [1, 2], blackRanks: [7, 8])
        let score = rankManager.score()
        
        XCTAssertEqual(score.whiteScore, 16)
        XCTAssertEqual(score.blackScore, 16)
    }
    
    func testRankDescriptions() {
        let rankManager: RankManager = RankManagerImpl(whiteRanks: [1, 2], blackRanks: [7, 8])
        let expect = ["♙♙♙♙♙♙♙♙",
                      "♙♙♙♙♙♙♙♙",
                      "........",
                      "........",
                      "........",
                      "........",
                      "♟♟♟♟♟♟♟♟",
                      "♟♟♟♟♟♟♟♟"]
        XCTAssertEqual(rankManager.rankDescriptions(), expect)
    }
}
