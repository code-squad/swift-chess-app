//
//  PawnTests.swift
//  swift chess appTests
//
//  Created by 윤태민(Yun, Taemin) on 2022/09/30.
//

import XCTest
@testable import swift_chess_app

final class PawnTests: XCTestCase {

    var sut: Pawn!
    
    func testPawnSymbol() throws {
        sut = Pawn(color: .black)
        XCTAssertEqual(sut.symbol, "♟")
        
        sut = Pawn(color: .white)
        XCTAssertEqual(sut.symbol, "♙")
    }
}
