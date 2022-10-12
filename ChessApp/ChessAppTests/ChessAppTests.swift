//
//  ChessAppTests.swift
//  ChessAppTests
//
//  Created by MK-AM16-010 on 2022/09/26.
//

import XCTest
@testable import ChessApp

final class ChessAppTests: XCTestCase {
  let size: Int = 8
  var board: Board!
  
  override func setUp() {
    super.setUp()
    
    self.board = Board()
  }
  
  // MARK: Rank Test
  func test_valid_rank() {
    let rank = Rank("1")
    
    XCTAssertTrue(rank == .one)
  }
  
  func test_invalid_rank() {
    let rank = Rank("Z")
    
    XCTAssertNil(rank)
  }
  
  func test_display_rank() {
    let rank = Rank(2)
    
    XCTAssertEqual(rank!.toDisplay, "2")
  }
  
  // MARK: File Test
  func test_valid_file() {
    let file = File("A")
    
    XCTAssertTrue(file == .A)
  }
  
  func test_invalid_file() {
    let file = File("9")
    
    XCTAssertNil(file)
  }
  
  func test_display_file() {
    let file = File("B")
    
    XCTAssertEqual(file!.toDisplay, "B")
  }
  
  // MARK: Position Test
  func test_position_coordinate_index() {
    let position = Position(file: File("A")!, rank: Rank("1")!)
    
    let indexs = position.toCoordinate()
    
    XCTAssertEqual(0, indexs.0)
    XCTAssertEqual(0, indexs.1)
  }
  
  func test_coordinate_move_file() {
    let position = Position(file: File("A")!, rank: Rank("1")!)
    
    let movedFile = position.move(fileIndex: 1)
    
    XCTAssertEqual(movedFile!, .B)
  }
  
  func test_coordinate_move_rank() {
    let position = Position(file: File("A")!, rank: Rank("1")!)
    
    let movedRank = position.move(rankIndex: 1)
    
    XCTAssertEqual(movedRank!, .two)
  }
  
  // MARK: Piece Test
  func test_get_blackpawn_shape() {
    let blackPawn = Pawn(color: .black)
    
    XCTAssertEqual(blackPawn.shape, "♟")
  }
  
  func test_get_whitepawn_shape() {
    let whitePawn = Pawn(color: .white)
    
    XCTAssertEqual(whitePawn.shape, "♙")
  }
  
  func test_get_empty_shape() {
    let empty = Empty()
    
    XCTAssertEqual(empty.shape, ".")
  }
  
  // MARK: PositionCoordinator Test
  func test_reset_blackPawn() {
    let coordinator = PieceCoordinator(positionSize: self.size)
    coordinator.reset()
    
    let piece = coordinator.getPiece(indexs: (2, 0))
    
    XCTAssertEqual(piece.shape, "♟")
    XCTAssertEqual(piece.color, .black)
  }
  
  func test_reset_whitePawn() {
    let coordinator = PieceCoordinator(positionSize: self.size)
    coordinator.reset()
    
    let piece = coordinator.getPiece(indexs: (7, 0))
    
    XCTAssertEqual(piece.shape, "♙")
    XCTAssertEqual(piece.color, .white)
  }
  
  func test_set_piece() {
    let coordinator = PieceCoordinator(positionSize: self.size)
    coordinator.reset()
    
    let emptyPiece = Empty()
    let pawn = coordinator.getPiece(indexs: (7, 0))
    XCTAssertNotNil(pawn as? Pawn)
    
    coordinator.setPiece(emptyPiece, indexs: (7, 0))
    let empty = coordinator.getPiece(indexs: (7, 0))
    XCTAssertNotNil(empty as? Empty)
  }
}
