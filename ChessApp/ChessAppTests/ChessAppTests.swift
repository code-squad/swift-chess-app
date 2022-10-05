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
  func test_valid_rank_get_index() {
    let rank = Rank("B")
    
    XCTAssertTrue(rank == .B)
  }
  
  func test_invalid_rank_get_index() {
    let rank = Rank("Z")
    
    XCTAssertNil(rank)
  }
  
  func test_valid_file_get_index() {
    let file = File("1")
    
    XCTAssertTrue(file == .one)
  }
  
  func test_invalid_file_get_index() {
    let file = File("9")
    
    XCTAssertNil(file)
  }
}
