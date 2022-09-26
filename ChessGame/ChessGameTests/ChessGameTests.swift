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
    
    func testPawnPosition() {
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
        func moveAndAssert(_ command: String) {
            let args = Array(command)
            XCTAssert(move(command))
            XCTAssertNil(game.board[.init(String(args[0...1]))!])
            XCTAssertNotNil(game.board[.init(String(args[2...3]))!])
        }
        
        [
            "A2A3",
            "A7A6",
            "A3A4",
            "A6A5",
            "A4A5"
        ]
            .forEach { moveAndAssert($0) }
    }
    
    func testMovementFails() {
        // 흰색 말이 두 턴 연속으로 이동
        XCTAssert(move("A2A3"))
        XCTAssertFalse(move("A3A4"))
        // 시작점에 이동시킬 기물이 없는 경우
        XCTAssertFalse(move("H5H4"))
    }
    
    func testBoardMovementFails() {
        var board = ChessBoard(files: 8, ranks: 8)
        board[Position("A2")!] = ChessPiece(type: .pawn, teamColor: .white)
        board[Position("A3")!] = ChessPiece(type: .pawn, teamColor: .white)
        
        // 흰색 폰이 뒤로 이동
        XCTAssertFalse(board.movePiece(from: .init("A2")!, to: .init("A1")!))
        // 흰색 폰이 다른 흰색 폰 위치로 이동
        XCTAssertFalse(board.movePiece(from: .init("A2")!, to: .init("A3")!))
    }
    
    private func move(_ command: String) -> Bool {
        let args = Array(command)
        return game.movePiece(
            from: .init(String(args[0...1]))!,
            to: .init(String(args[2...3]))!
        )
    }
}
