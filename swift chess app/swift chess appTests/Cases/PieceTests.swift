//
//  PieceTests.swift
//  swift chess appTests
//
//  Created by 윤태민(Yun, Taemin) on 2022/09/30.
//

import XCTest
@testable import swift_chess_app

final class PieceTests: XCTestCase {

    func testPawn() throws {
        XCTAssertEqual(Pawn.maxCount, 8)
        
        var sut: Pawn!
        sut = Pawn(color: .black)
        XCTAssertEqual(sut.getSymbol().image, "♟")
        
        sut = Pawn(color: .white)
        XCTAssertEqual(sut.getSymbol().image, "♙")
    }
    
    func testBishop() throws {
        XCTAssertEqual(Bishop.maxCount, 2)
        
        var sut: Bishop!
        sut = Bishop(color: .black)
        XCTAssertEqual(sut.getSymbol().image, "♝")
        
        sut = Bishop(color: .white)
        XCTAssertEqual(sut.getSymbol().image, "♗")
    }
}
