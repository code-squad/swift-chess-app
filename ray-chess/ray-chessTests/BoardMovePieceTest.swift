//
//  PawnMoveTest.swift
//  ray-chessTests
//
//  Created by 김상진 on 2022/09/26.
//

import XCTest
@testable import ray_chess

class BoardMovePieceTest: XCTestCase {

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func testCanMovePawn() {
        let chessGame = ChessGame()
        chessGame.initializePieces()
        
        let firstFrom = Piece.Position(rank: .two, file: .B)
        let firstTo = Piece.Position(rank: .three, file: .B)
        let firstMove = chessGame.board.canMovePiece(
            from: firstFrom,
            to: firstTo,
            currentColor: .black
        )
        XCTAssertEqual(firstMove, .success(true))
        chessGame.board.movePawn(from: firstFrom, to: firstTo)
        
        let secondFrom = Piece.Position(rank: .one, file: .C)
        let secondTo = Piece.Position(rank: .two, file: .B)
        let secondMove = chessGame.board.canMovePiece(
            from: secondFrom,
            to: secondTo,
            currentColor: .black
        )
        XCTAssertEqual(secondMove, .success(true))
        chessGame.board.movePawn(from: secondFrom, to: secondTo)
    }
    
    func testTargetPieceIsEmpty() {
        let chessGame = ChessGame()
        chessGame.initializePieces()
        
        let failure = chessGame.board.canMovePiece(
            from: Piece.Position(rank: .four, file: .B),
            to: Piece.Position(rank: .three, file: .B),
            currentColor: .black
        )
        XCTAssertEqual(failure, .failure(.isEmptySpace))
        
        let success = chessGame.board.canMovePiece(
            from: Piece.Position(rank: .two, file: .B),
            to: Piece.Position(rank: .three, file: .B),
            currentColor: .black
        )
        XCTAssertEqual(success, .success(true))
    }
    
    func testIsMyPiece() {
        let chessGame = ChessGame()
        chessGame.initializePieces()
        
        let rook = Rook(color: .white, position: .init(rank: .eight, file: .A))
        let failure = chessGame.board.isMyPiece(targetPiece: rook, currentColor: .black)
        let success = chessGame.board.isMyPiece(targetPiece: rook, currentColor: .white)
        XCTAssertEqual(failure, false)
        XCTAssertEqual(success, true)
    }
    
    func testExistSameColorPiece() {
        let chessGame = ChessGame()
        chessGame.initializePieces()
        
        let bishop = Bishop(color: .black, position: .init(rank: .one, file: .C))
        let success = chessGame.board.isBlockedByMyPiece(targetPiece: bishop, to: .init(rank: .two, file: .B))
        XCTAssertEqual(success, true)
        
        let failure = chessGame.board.isBlockedByMyPiece(targetPiece: bishop, to: .init(rank: .three, file: .A))
        XCTAssertEqual(failure, false)
    }
    
    func testIsReachablePositions() {
        let chessGame = ChessGame()
        
        let pawn = Pawn(color: .white, position: .init(rank: .seven, file: .A))
        let firstResult = chessGame.board.isReachablePosition(targetPiece: pawn, to: .init(rank: .six, file: .A))
        XCTAssertEqual(firstResult, true)
        
        let bishop = Bishop(color: .white, position: .init(rank: .eight, file: .C))
        let secondResult = chessGame.board.isReachablePosition(targetPiece: bishop, to: .init(rank: .six, file: .A))
        XCTAssertEqual(secondResult, true)
        
        let rook = Rook(color: .white, position: .init(rank: .eight, file: .H))
        let thirdResult = chessGame.board.isReachablePosition(targetPiece: rook, to: .init(rank: .four, file: .H))
        XCTAssertEqual(thirdResult, true)
        
    }
}
