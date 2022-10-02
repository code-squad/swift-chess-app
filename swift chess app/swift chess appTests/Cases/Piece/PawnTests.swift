//
//  PawnTests.swift
//  swift chess appTests
//
//  Created by 윤태민(Yun, Taemin) on 2022/10/01.
//

import XCTest
@testable import swift_chess_app

final class PawnTests: XCTestCase {

    var sut: Pawn!
    
    func testBlackPawnMove() {
        let sut = Pawn(color: .black)
        
        var from: Location
        var to: Location
        
        from = Location(row: 1, col: 1)
        to = Location(row: 2, col: 1)
        XCTAssertTrue(sut.isMovable(from: from, to: to))
        
        from = Location(row: 3, col: 4)
        to = Location(row: 2, col: 4)
        XCTAssertFalse(sut.isMovable(from: from, to: to))
    }
    
    func testWhitePawnisMovable() {
        let sut = Pawn(color: .white)
        
        var from: Location
        var to: Location

        from = Location(row: 1, col: 1)
        to = Location(row: 2, col: 1)
        XCTAssertFalse(sut.isMovable(from: from, to: to))
        
        from = Location(row: 3, col: 4)
        to = Location(row: 2, col: 4)
        XCTAssertTrue(sut.isMovable(from: from, to: to))
    }
}
