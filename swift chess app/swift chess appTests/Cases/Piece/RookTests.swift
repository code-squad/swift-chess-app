//
//  RookTests.swift
//  swift chess appTests
//
//  Created by 윤태민(Yun, Taemin) on 2022/10/01.
//

import XCTest
@testable import swift_chess_app

final class RookTests: XCTestCase {
    
    var sut: Rook!
    
    func testRookMove() throws {
        let sut = Rook(color: .black)
        
        let from = Location(rank: 4, file: 5)
        var to: Location
        
        to = Location(rank: 2, file: 5)
        XCTAssertTrue(sut.move(from: from, to: to))
        
        to = Location(rank: 7, file: 5)
        XCTAssertTrue(sut.move(from: from, to: to))
        
        to = Location(rank: 4, file: 1)
        XCTAssertTrue(sut.move(from: from, to: to))
        
        to = Location(rank: 4, file: 6)
        XCTAssertTrue(sut.move(from: from, to: to))
        
        
        to = Location(rank: 3, file: 4)
        XCTAssertFalse(sut.move(from: from, to: to))
        
        to = Location(rank: 2, file: 7)
        XCTAssertFalse(sut.move(from: from, to: to))
        
        to = Location(rank: 6, file: 3)
        XCTAssertFalse(sut.move(from: from, to: to))
        
        to = Location(rank: 6, file: 7)
        XCTAssertFalse(sut.move(from: from, to: to))
    }
}
