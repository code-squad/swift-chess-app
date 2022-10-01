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
        
        let whitePawn = PawnPiece(teamColor: .white)
        XCTAssertEqual(PawnPiece.availableMovingPositions(at: .init("A2")!, board: board), [.init("A3")!])
    }
    
    func testAllMovementsOfBlackPawn() {
        let board = ChessBoard.standardChessBoard()
        
        let blackPawn = PawnPiece(teamColor: .black)
        XCTAssertEqual(PawnPiece.availableMovingPositions(at: .init("A7")!, board: board), [.init("A6")!])
    }
}
