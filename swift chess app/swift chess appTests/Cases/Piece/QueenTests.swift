//
//  QueenTests.swift
//  swift chess appTests
//
//  Created by 윤태민(Yun, Taemin) on 2022/10/01.
//

import XCTest
@testable import swift_chess_app

final class QueenTests: XCTestCase {
    
    var sut: Queen!
    
    func testQueenMove() {
        let sut = Queen(color: .black)
        
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
        
        to = Location(row: 2, col: 5)
        XCTAssertTrue(sut.isMovable(from: from, to: to))
        
        to = Location(row: 7, col: 5)
        XCTAssertTrue(sut.isMovable(from: from, to: to))
        
        to = Location(row: 4, col: 1)
        XCTAssertTrue(sut.isMovable(from: from, to: to))
        
        to = Location(row: 4, col: 6)
        XCTAssertTrue(sut.isMovable(from: from, to: to))
        
        
        to = Location(row: 2, col: 4)
        XCTAssertFalse(sut.isMovable(from: from, to: to))
        
        to = Location(row: 2, col: 8)
        XCTAssertFalse(sut.isMovable(from: from, to: to))
        
        to = Location(row: 7, col: 3)
        XCTAssertFalse(sut.isMovable(from: from, to: to))
        
        to = Location(row: 6, col: 6)
        XCTAssertFalse(sut.isMovable(from: from, to: to))
    }
}
