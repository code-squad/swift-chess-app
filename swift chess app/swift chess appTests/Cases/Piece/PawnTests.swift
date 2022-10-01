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
    
    func testBlackPawnMove() throws {
        let sut = Pawn(color: .black)
        
        var from: Location
        var to: Location
        
        from = Location(rank: 1, file: 1)
        to = Location(rank: 2, file: 1)
        XCTAssertTrue(sut.move(from: from, to: to))
        
        from = Location(rank: 3, file: 4)
        to = Location(rank: 2, file: 4)
        XCTAssertFalse(sut.move(from: from, to: to))
    }
    
    func testWhitePawnMove() throws {
        let sut = Pawn(color: .white)
        
        var from: Location
        var to: Location

        from = Location(rank: 1, file: 1)
        to = Location(rank: 2, file: 1)
        XCTAssertFalse(sut.move(from: from, to: to))
        
        from = Location(rank: 3, file: 4)
        to = Location(rank: 2, file: 4)
        XCTAssertTrue(sut.move(from: from, to: to))
    }
}
