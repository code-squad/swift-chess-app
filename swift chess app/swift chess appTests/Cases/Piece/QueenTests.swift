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
    
    func testQueenMove() throws {
        let sut = Queen(color: .black)
        
        let from = Location(rank: 4, file: 5)
        var to: Location
        
        to = Location(rank: 3, file: 4)
        XCTAssertTrue(sut.howToMove(from: from, to: to))
        
        to = Location(rank: 2, file: 7)
        XCTAssertTrue(sut.howToMove(from: from, to: to))
        
        to = Location(rank: 6, file: 3)
        XCTAssertTrue(sut.howToMove(from: from, to: to))
        
        to = Location(rank: 6, file: 7)
        XCTAssertTrue(sut.howToMove(from: from, to: to))
        
        to = Location(rank: 2, file: 5)
        XCTAssertTrue(sut.howToMove(from: from, to: to))
        
        to = Location(rank: 7, file: 5)
        XCTAssertTrue(sut.howToMove(from: from, to: to))
        
        to = Location(rank: 4, file: 1)
        XCTAssertTrue(sut.howToMove(from: from, to: to))
        
        to = Location(rank: 4, file: 6)
        XCTAssertTrue(sut.howToMove(from: from, to: to))
        
        
        to = Location(rank: 2, file: 4)
        XCTAssertFalse(sut.howToMove(from: from, to: to))
        
        to = Location(rank: 2, file: 8)
        XCTAssertFalse(sut.howToMove(from: from, to: to))
        
        to = Location(rank: 7, file: 3)
        XCTAssertFalse(sut.howToMove(from: from, to: to))
        
        to = Location(rank: 6, file: 6)
        XCTAssertFalse(sut.howToMove(from: from, to: to))
    }
}
