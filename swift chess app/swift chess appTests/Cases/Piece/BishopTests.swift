//
//  BishopTests.swift
//  swift chess appTests
//
//  Created by 윤태민(Yun, Taemin) on 2022/10/01.
//

import XCTest
@testable import swift_chess_app

final class BishopTests: XCTestCase {
    
    var sut: Bishop!
    
    func testBishopMove() {
        let sut = Bishop(color: .black)
        
        let from = Location(row: 4, col: 5)
        var to: Location
        
        to = Location(row: 3, col: 4)
        XCTAssertTrue(sut.isMovable(from: from, to: to))
        
        to = Location(row: 2, col: 7)
        XCTAssertTrue(sut.isMovable(from: from, to: to))
        
        to = Location(row: 6, col: 3)
        XCTAssertTrue(sut.isMovable(from: from, to: to))
        
        to = Location(row: 6, col: 7)
        XCTAssertTrue(sut.isMovable(from: from, to: to))
        
        
        to = Location(row: 4, col: 4)
        XCTAssertFalse(sut.isMovable(from: from, to: to))
        
        to = Location(row: 1, col: 5)
        XCTAssertFalse(sut.isMovable(from: from, to: to))
        
        to = Location(row: 4, col: 7)
        XCTAssertFalse(sut.isMovable(from: from, to: to))
        
        to = Location(row: 5, col: 5)
        XCTAssertFalse(sut.isMovable(from: from, to: to))
    }
}
