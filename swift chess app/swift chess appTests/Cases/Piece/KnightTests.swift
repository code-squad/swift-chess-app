//
//  KnightTests.swift
//  swift chess appTests
//
//  Created by 윤태민(Yun, Taemin) on 2022/10/01.
//

import XCTest
@testable import swift_chess_app

final class KnightTests: XCTestCase {
    
    var sut: Knight!
    
    func testBishopMove() throws {
        let sut = Knight(color: .black)
        
        let from = Location(rank: 4, file: 5)
        var to: Location
        
        to = Location(rank: 3, file: 3)
        XCTAssertTrue(sut.howToMove(from: from, to: to))
        to = Location(rank: 5, file: 3)
        XCTAssertTrue(sut.howToMove(from: from, to: to))
        
        to = Location(rank: 2, file: 4)
        XCTAssertTrue(sut.howToMove(from: from, to: to))
        to = Location(rank: 2, file: 6)
        XCTAssertTrue(sut.howToMove(from: from, to: to))
        
        to = Location(rank: 3, file: 7)
        XCTAssertTrue(sut.howToMove(from: from, to: to))
        to = Location(rank: 5, file: 7)
        XCTAssertTrue(sut.howToMove(from: from, to: to))
        
        to = Location(rank: 6, file: 4)
        XCTAssertTrue(sut.howToMove(from: from, to: to))
        to = Location(rank: 6, file: 6)
        XCTAssertTrue(sut.howToMove(from: from, to: to))
        
        
        to = Location(rank: 4, file: 4)
        XCTAssertFalse(sut.howToMove(from: from, to: to))
        
        to = Location(rank: 1, file: 5)
        XCTAssertFalse(sut.howToMove(from: from, to: to))
        
        to = Location(rank: 4, file: 7)
        XCTAssertFalse(sut.howToMove(from: from, to: to))
        
        to = Location(rank: 5, file: 5)
        XCTAssertFalse(sut.howToMove(from: from, to: to))
    }
}
