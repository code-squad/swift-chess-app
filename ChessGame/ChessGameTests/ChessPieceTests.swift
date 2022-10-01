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
        
        let positions = BishopPiece.availableMovingPositions(at: .init("C1")!, board: board)
        let expected = Set(
            [
                "A3",
                "E3", "F4", "G5", "H6"
            ]
                .map { Position($0)! }
        )
        XCTAssertEqual(positions, expected)
    }
    
    func testAllMovementsOfBlackBishop() {
        let board = ChessBoard.standardChessBoard()
        
        let positions = BishopPiece.availableMovingPositions(at: .init("C8")!, board: board)
        let expected = Set(
            [
                "A6",
                "E6", "F5", "G4", "H3"
            ]
                .map { Position($0)! }
        )
        XCTAssertEqual(positions, expected)
    }
    
    func testAllMovementsOfWhiteRook() {
        let board = ChessBoard.standardChessBoard()
        
        let positions = RookPiece.availableMovingPositions(at: .init("A1")!, board: board)
        let expected = Set(
            [
                "A3", "A4", "A5", "A6", "A7", "A8",
                "B1", "D1", "E1", "G1"
            ]
                .map { Position($0)! }
        )
        XCTAssertEqual(positions, expected)
    }
    func testAllMovementsOfBlackRook() {
        let board = ChessBoard.standardChessBoard()
        
        let positions = RookPiece.availableMovingPositions(at: .init("A8")!, board: board)
        let expected = Set(
            [
                "A6", "A5", "A4", "A3", "A2", "A1",
                "B8", "D8", "E8", "G8"
            ]
                .map { Position($0)! }
        )
        XCTAssertEqual(positions, expected)
    }
}
