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
    
    func testAllMovementsOfBishop() {
        var board = ChessBoard(files: 8, ranks: 8)
        
        board[.init("D5")!] = BishopPiece(teamColor: .black)
        
        let positions = BishopPiece.availableMovingPositions(at: .init("D5")!, board: board)
        let expected = Set(
            ["A2", "B3", "C4",
             "C6", "B7", "A8",
             "E6", "F7", "G8",
             "E4", "F3", "G2", "H1"
            ].map { Position($0)! }
        )
        XCTAssertEqual(positions, expected)
    }
    
    func testAllMovementsOfRook() {
        var board = ChessBoard(files: 8, ranks: 8)
        
        let initialPosition = Position("D5")!
        
        board[initialPosition] = RookPiece(teamColor: .white)
        
        let positions = RookPiece.availableMovingPositions(at: initialPosition, board: board)
        var expected = Set<Position>()
        for file in 0..<8 {
            expected.insert(.init(file: file, rank: 4))
        }
        for rank in 0..<8 {
            expected.insert(.init(file: 3, rank: rank))
        }
        expected.remove(initialPosition)
        
        XCTAssertEqual(positions, expected)
    }
    
    func testAllMovementsOfKight() {
        var board = ChessBoard(files: 8, ranks: 8)
        
        board[.init("D4")!] = KightPiece(teamColor: .white)
        board[.init("D3")!] = PawnPiece(teamColor: .white)
        
        let positions = KightPiece.availableMovingPositions(at: .init("D4")!, board: board)
        let expected = Set(
            ["B5", "B3",
             "F5", "F3",
             "C6", "E6",
//             "C2", "E2" // 가로막고 있어 움직일 수 없다
            ].map { Position($0)! }
        )
        XCTAssertEqual(positions, expected)
    }
    
    func testAllMovementsOfQueen() {
        var board = ChessBoard(files: 8, ranks: 8)
        
        board[.init("D4")!] = QueenPiece(teamColor: .white)
        let positions = QueenPiece.availableMovingPositions(at: .init("D4")!, board: board)
        let expected = Set(
            ["A1", "A4", "A7",
             "B2", "B4", "B6",
             "C3", "C4", "C5",
             "D1", "D2", "D3", "D5", "D6", "D7", "D8",
             "E3", "E4", "E5",
             "F2", "F4", "F6",
             "G1", "G4", "G7",
             "H4", "H8"
            ].map { Position($0)! }
        )
        XCTAssertEqual(positions, expected)
    }
}
