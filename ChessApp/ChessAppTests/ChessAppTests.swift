//
//  ChessAppTests.swift
//  ChessAppTests
//
//  Created by MK-AM16-010 on 2022/09/26.
//

import XCTest
@testable import ChessApp

final class ChessAppTests: XCTestCase {
  var board: Board!
  
  override func setUp() {
    super.setUp()
    
    self.board = Board(size: 8)
  }
  
  func testBoardDisplay() {
    let expectBoard = """
                       ABCDEFGH
                      1........
                      2♟♟♟♟♟♟♟♟
                      3........
                      4........
                      5........
                      6........
                      7♙♙♙♙♙♙♙♙
                      8........
                       ABCDEFGH
                      """
    
    let displayBoard = self.board.display()
    
    XCTAssertEqual(expectBoard, displayBoard)
  }
  
  func testInitBoardDisplayScore() {
    let expectBoardScore = "흑: 8 백: 8"
    
    let displayBoardScore = self.board.displayScore()
    
    XCTAssertEqual(expectBoardScore, displayBoardScore)
  }
  
  func testChecValidationkMoviePosition() {
    let isMovable = self.board.movePiece(from: "AA", to: "A1")
    
    XCTAssertFalse(isMovable)
  }
  
  // MARK: Position Test
  func test_valid_rank_initializer() {
    let rank = Rank(position: ["1", "2"], size: 2)
    
    XCTAssertNotNil(rank)
  }
  
  func test_invalid_rank_initializer() {
    let rank = Rank(position: ["1", "2", "3"], size: 2)
    
    XCTAssertNil(rank)
  }
  
  func test_valid_file_initializer() {
    let rank = File(position: ["1", "2"], size: 2)
    
    XCTAssertNotNil(rank)
  }
  
  func test_invalid_file_initializer() {
    let rank = File(position: ["1", "2"], size: 3)
    
    XCTAssertNil(rank)
  }
}
