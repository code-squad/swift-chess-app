//
//  chessAppTests.swift
//  chessAppTests
//
//  Created by MK-AM16-005 on 2022/09/27.
//

import XCTest
@testable import chessApp

final class chessAppTests: XCTestCase {
  
  // MARK: - ChessPiece  
  func testMovementsOfPawn() {
    let board = ChessBoard.initializeChessBoard()
    XCTAssertTrue(board.moveToChessPiece(from: .init("A7")!, to: .init("A6")!))
    print(board.description())
    XCTAssertTrue(board.moveToChessPiece(from: .init("A2")!, to: .init("A3")!))
    print(board.description())
  }
    
  func testAllMovementsOfPawn() {
    if let whitePawn: ChessPawn = ChessPiece(position: .init("A2")!, color: .white, type: .pawn) as? ChessPawn {
      XCTAssertEqual(whitePawn.availableRange(), [.init("A3")!])
    }
    
    if let blackPawn: ChessPawn = ChessPiece(position: .init("A7")!, color: .black, type: .pawn) as? ChessPawn {
      XCTAssertEqual(blackPawn.availableRange(), [.init("A6")!])
    }
  }
  
  func testPawnPosition() {
    let board = ChessBoard.initializeChessBoard()
    for rank in 0..<count.boardCount {
      XCTAssertEqual(
        board[Position(rank: rank, file: 1)],
        ChessPiece(position: Position(rank: rank, file: 1), color: .white, type: .pawn)
      )
      XCTAssertEqual(
        board[Position(rank: rank, file: 6)],
        ChessPiece(position: Position(rank: rank, file: 6), color: .black, type: .pawn)
      )
    }
  }
  
  func testBoardPawnsCount() {
    let board = ChessBoard.initializeChessBoard()
    let whitePawnCount = board.pieces
      .filter { $0.color == .white && $0.pieceType == .pawn }
      .count
    XCTAssertEqual(whitePawnCount, 8)
    let blackPawnCount = board.pieces
      .filter { $0.color == .black && $0.pieceType == .pawn }
      .count
    XCTAssertEqual(blackPawnCount, 8)
  }
}
