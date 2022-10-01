//
//  ChessBoardTests.swift
//  ChessGameTests
//
//  Created by Sunghyun Kim on 2022/10/01.
//

import XCTest
@testable import ChessGame

final class ChessBoardTests: XCTestCase {
    
    // MARK: - Test Pawn
    
    func testPawnPosition() {
        let board = ChessBoard.standardChessBoard()
        
        for file in 0..<board.filesCount {
            let whitePawn = board[Position(file: file, rank: 1)]
            XCTAssertEqual(whitePawn?.teamColor, .white)
            XCTAssert(whitePawn is PawnPiece)
            
            let blackPawn = board[Position(file: file, rank: 6)]
            XCTAssertEqual(blackPawn?.teamColor, .black)
            XCTAssert(blackPawn is PawnPiece)
        }
    }
    
    func testCountBoardHas8Pawns() {
        let board = ChessBoard.standardChessBoard()
        
        let whitePawnCount = board.allPieces
            .filter { $0 is PawnPiece && $0.teamColor == .white }
            .count
        XCTAssertEqual(whitePawnCount, 8)
        
        let blackPawnCount = board.allPieces
            .filter { $0 is PawnPiece && $0.teamColor == .black }
            .count
        XCTAssertEqual(blackPawnCount, 8)
    }
    
    func testPawnMovementFails() {
        var board = ChessBoard(files: 8, ranks: 8)
        
        board[Position("A2")!] = PawnPiece(teamColor: .white)
        board[Position("A3")!] = PawnPiece(teamColor: .white)
        
        // 흰색 폰이 뒤로 이동
        XCTAssertFalse(board.movePiece(from: .init("A2")!, to: .init("A1")!))
        // 흰색 폰이 다른 흰색 폰 위치로 이동
        XCTAssertFalse(board.movePiece(from: .init("A2")!, to: .init("A3")!))
    }
    
    // MARK: - Test Bishop
    
    func testBishopPosition() {
        let board = ChessBoard.standardChessBoard()
        
        ["C1", "F1"]
            .map { board[Position($0)!] }
            .forEach {
                XCTAssertEqual($0?.teamColor, .white)
                XCTAssert($0 is BishopPiece)
            }
        
        ["C8", "F8"]
            .map { board[Position($0)!] }
            .forEach {
                XCTAssertEqual($0?.teamColor, .black)
                XCTAssert($0 is BishopPiece)
            }
    }
    
    func testScoreSum() {
        var board = ChessBoard.standardChessBoard()
        
        var scoreSum = board.scoreSum()
        XCTAssertEqual(scoreSum.white, 1*8 + 3*2 + 5*2)
        XCTAssertEqual(scoreSum.black, 1*8 + 3*2 + 5*2)
        
        board[.init("A2")!] = nil
        board[.init("A7")!] = nil
        board[.init("B7")!] = nil
        
        scoreSum = board.scoreSum()
        XCTAssertEqual(scoreSum.white, 1*7 + 3*2 + 5*2)
        XCTAssertEqual(scoreSum.black, 1*6 + 3*2 + 5*2)
    }
}
