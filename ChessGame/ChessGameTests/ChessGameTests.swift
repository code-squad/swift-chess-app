//
//  ChessGameTests.swift
//  ChessGameTests
//
//  Created by Sunghyun Kim on 2022/09/24.
//

import XCTest
@testable import ChessGame

final class ChessGameTests: XCTestCase {
    
    var game: ChessGame!
    
    override func setUpWithError() throws {
        game = ChessGame()
    }
    
    func testChessBoard() {
        let board = ChessBoard.standardChessBoard()
        
        for file in 0..<board.filesCount {
            XCTAssertEqual(
                board[Position(file: file, rank: 1)],
                ChessPiece(type: .pawn, teamColor: .white)
            )
            XCTAssertEqual(
                board[Position(file: file, rank: 6)],
                ChessPiece(type: .pawn, teamColor: .black)
            )
        }
    }
    
    func testCountBoardHas8Pawns() {
        let board = ChessBoard.standardChessBoard()
        let whitePawnCount = board.allPieces
            .filter { $0.teamColor == .white && $0.type == .pawn }
            .count
        XCTAssertEqual(whitePawnCount, 8)
        let blackPawnCount = board.allPieces
            .filter { $0.teamColor == .black && $0.type == .pawn }
            .count
        XCTAssertEqual(blackPawnCount, 8)
    }
    
    func testMovement() {
        [
            "A2A3",
            "A7A6",
            "A3A4",
            "A6A5",
            "A4A5"
        ]
            .forEach { XCTAssert(move($0)) }
    }
    
    private func move(_ command: String) -> Bool {
        let args = Array(command)
        return game.movePiece(
            from: .init(String(args[0...1]))!,
            to: .init(String(args[2...3]))!
        )
    }
}
