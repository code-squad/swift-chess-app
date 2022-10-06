//
//  ChessGameTest.swift
//  ChessGameTest
//
//  Created by USER on 2022/10/06.
//

import XCTest
@testable import ChessGamePair

final class ChessGameTest: XCTestCase {
    func test_init_whiteKing_success() {
        // when
        var whiteKing = WhiteKing()
        
        // then
        whiteKing.create()
        let checkLocation = whiteKing.currentLocation == Location(file: "D", rank: 8)
        let checkColor = whiteKing.color == "white"
        
        // given
        XCTAssertTrue(checkColor)
        XCTAssertTrue(checkLocation)
    }
    
    func test_init_blackKing_success() {
        // when
        var blackKing = BlackKing()
        
        // then
        blackKing.create()
        let result = blackKing.currentLocation == Location(file: "D", rank: 1)
        
        // given
        XCTAssertTrue(result)
    }
    
    func test_init_blackKing_fail() {
        // when
        var blackKing = BlackKing()
        
        // then
        blackKing.create()
        let result = blackKing.currentLocation == Location(file: "D", rank: 8)
        
        // given
        XCTAssertFalse(result)
    }
    
}
