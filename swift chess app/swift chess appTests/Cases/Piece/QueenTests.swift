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
        sut = Queen(color: .black)
        
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
    
    func testQueenBlock() {
        sut = Queen(color: .white)
        
        var board: [[Pieceable?]]
        let row = [Pieceable?](repeating: nil, count: 8)
        board = [[Pieceable?]](repeating: row, count: 8)
        
        /*
         ABCDEFGH
        1.......♜
        2..♟.♟.♖.
        3........
        4.♟..♕..♟
        5.....♟..
        6....♙...
        7....♜...
        8♛.......
         ABCDEFGH
         */
        
        board[3][4] = sut
        
        board[0][7] = Rook(color: .black)
        board[1][2] = Pawn(color: .black)
        board[1][4] = Pawn(color: .black)
        board[1][6] = Rook(color: .white)
        board[3][1] = Pawn(color: .black)
        board[3][7] = Pawn(color: .black)
        board[4][5] = Pawn(color: .black)
        board[5][4] = Pawn(color: .white)
        board[6][4] = Rook(color: .black)
        board[7][0] = Queen(color: .black)
        
        XCTAssertTrue(sut.isBlocked(from: Location(row: 3, col: 4),
                                     to: Location(row: 0, col: 7),
                                     board: board))
        XCTAssertFalse(sut.isBlocked(from: Location(row: 3, col: 4),
                                     to: Location(row: 1, col: 2),
                                     board: board))
        XCTAssertFalse(sut.isBlocked(from: Location(row: 3, col: 4),
                                     to: Location(row: 1, col: 4),
                                     board: board))
        XCTAssertFalse(sut.isBlocked(from: Location(row: 3, col: 4),
                                     to: Location(row: 3, col: 1),
                                     board: board))
        XCTAssertFalse(sut.isBlocked(from: Location(row: 3, col: 4),
                                     to: Location(row: 3, col: 7),
                                     board: board))
        XCTAssertFalse(sut.isBlocked(from: Location(row: 3, col: 4),
                                     to: Location(row: 4, col: 5),
                                     board: board))
        XCTAssertTrue(sut.isBlocked(from: Location(row: 3, col: 4),
                                     to: Location(row: 6, col: 4),
                                     board: board))
        XCTAssertFalse(sut.isBlocked(from: Location(row: 3, col: 4),
                                     to: Location(row: 7, col: 0),
                                     board: board))
    }

}
