//
//  ChessPieceTesst.swift
//  ChessGameTests
//
//  Created by Sunghyun Kim on 2022/10/01.
//

import XCTest
@testable import ChessGame

final class ChessPieceTests: XCTestCase {
    
    func testAllMovementsOfWhitePawn() {
        let board = ChessBoard.standardChessBoard()
        
        let positions = PawnPiece.availableMovingPositions(at: .init("A2")!, board: board)
        let expected: Set<Position> = [Position("A3")!]
        XCTAssertEqual(positions, expected)
    }
    
    func testAllMovementsOfBlackPawn() {
        let board = ChessBoard.standardChessBoard()
        
        let positions = PawnPiece.availableMovingPositions(at: .init("A7")!, board: board)
        let expected: Set<Position> = [Position("A6")!]
        XCTAssertEqual(positions, expected)
    }
    
    func testAllMovementsOfWhiteBishop() {
        let board = ChessBoard.standardChessBoard()
        
        let positions = PawnPiece.availableMovingPositions(at: .init("C1")!, board: board)
        let expected = Set(
            [
                "B2", "A3",
                "D2", "E3", "F4", "G5", "H6"
            ]
                .map { Position($0)! }
        )
        XCTAssertEqual(positions, expected)
    }
}
