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
    
    func testBishopMovementFails() {
        var board = ChessBoard.standardChessBoard()
        
        // 흰색 비숍이 정면으로 2칸 이동
        XCTAssertFalse(board.movePiece(from: .init("C1")!, to: .init("C3")!))
        // 흰색 비숍이 아군 말 위로 이동
        XCTAssertFalse(board.movePiece(from: .init("C1")!, to: .init("B2")!))
    }
    
    // MARK: - Test Rook
    
    func testRookPosition() {
        let board = ChessBoard.standardChessBoard()
        
        ["A1", "H1"]
            .map { board[Position($0)!] }
            .forEach {
                XCTAssertEqual($0?.teamColor, .white)
                XCTAssert($0 is RookPiece)
            }
        
        ["A8", "H8"]
            .map { board[Position($0)!] }
            .forEach {
                XCTAssertEqual($0?.teamColor, .black)
                XCTAssert($0 is RookPiece)
            }
    }
    
    func testRookMovementFails() {
        var board = ChessBoard.standardChessBoard()
        
        // 흰색 룩이 나이트처럼 이동
        XCTAssertFalse(board.movePiece(from: .init("A1")!, to: .init("B2")!))
        // 흰색 룩이 아군 말 위로 이동
        XCTAssertFalse(board.movePiece(from: .init("A1")!, to: .init("A2")!))
    }
    
    func testScoreSum() {
        var board = ChessBoard.standardChessBoard()
        
        var whitePawnCount = 8
        var whiteBishopCount = 2
        var whiteRookCount = 2
        
        var blackPawnCount = 8
        var blackBishopCount = 2
        var blackRookCount = 2
        
        func whiteScore() -> Int {
            1 * whitePawnCount + 3 * whiteBishopCount + 5 * whiteRookCount
        }
        func blackScore() -> Int {
            1 * blackPawnCount + 3 * blackBishopCount + 5 * blackRookCount
        }
        
        var scoreSum = board.scoreSum()
        XCTAssertEqual(scoreSum.white, whiteScore())
        XCTAssertEqual(scoreSum.black, blackScore())
        
        board[.init("A2")!] = nil
        whitePawnCount -= 1
        
        board[.init("A7")!] = nil
        board[.init("B7")!] = nil
        blackPawnCount -= 2
        
        scoreSum = board.scoreSum()
        XCTAssertEqual(scoreSum.white, whiteScore())
        XCTAssertEqual(scoreSum.black, blackScore())
        
        board[.init("C1")!] = nil
        whiteBishopCount -= 1
        
        board[.init("C8")!] = nil
        board[.init("F8")!] = nil
        blackBishopCount -= 2
        
        scoreSum = board.scoreSum()
        XCTAssertEqual(scoreSum.white, whiteScore())
        XCTAssertEqual(scoreSum.black, blackScore())
        
        board[.init("A1")!] = nil
        whiteRookCount -= 1
        
        board[.init("A8")!] = nil
        board[.init("H8")!] = nil
        blackRookCount -= 2
        
        scoreSum = board.scoreSum()
        XCTAssertEqual(scoreSum.white, whiteScore())
        XCTAssertEqual(scoreSum.black, blackScore())
    }
}
