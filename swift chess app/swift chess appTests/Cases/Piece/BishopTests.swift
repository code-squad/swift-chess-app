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
        sut = Bishop(color: .black)
        
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
    
    func testBishopBlock() {
        sut = Bishop(color: .black)
        
        var board: [[Pieceable?]]
        let row = [Pieceable?](repeating: nil, count: 8)
        board = [[Pieceable?]](repeating: row, count: 8)
        
        /*
         ABCDEFGH
        1.......♖
        2........
        3...♙....
        4....♝...
        5........
        6..♟...♙.
        7.♙......
        8........
         ABCDEFGH
         */
        
        board[3][4] = sut
        
        board[0][7] = Rook(color: .white)
        board[2][3] = Pawn(color: .white)
        board[5][2] = Pawn(color: .black)
        board[5][6] = Pawn(color: .white)
        board[6][1] = Pawn(color: .white)
        
        XCTAssertFalse(sut.isBlocked(from: Location(row: 3, col: 4),
                                     to: Location(row: 0, col: 7),
                                     board: board))
        XCTAssertFalse(sut.isBlocked(from: Location(row: 3, col: 4),
                                     to: Location(row: 2, col: 3),
                                     board: board))
        XCTAssertFalse(sut.isBlocked(from: Location(row: 3, col: 4),
                                     to: Location(row: 5, col: 6),
                                     board: board))
        XCTAssertTrue(sut.isBlocked(from: Location(row: 3, col: 4),
                                     to: Location(row: 6, col: 1),
                                     board: board))
    }
}
