//
//  BoardTests.swift
//  SwiftChessAppTests
//
//  Created by Freddy on 2022/09/27.
//

import XCTest
@testable import SwiftChessApp

final class BoardTests: XCTestCase {
  var board: Board!

  override func setUp() {
    super.setUp()

    board = Board()
  }

  func testInitialPiecesDisplay() {
    let result = """
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

    XCTAssertEqual(board.display(), result)
  }

  func testMovePiecesAndDisplay() {
    let result = """
     ABCDEFGH
    1........
    2.♟♟♟♟♟♟♟
    3.♟......
    4........
    5.......♙
    6........
    7♙♙♙♙♙♙♙.
    8........
     ABCDEFGH
    """

    XCTAssertTrue(board.move(from: .init(string: "A2"), to: .init(string: "A3")))
    XCTAssertTrue(board.move(from: .init(string: "H7"), to: .init(string: "H6")))
    XCTAssertTrue(board.move(from: .init(string: "A3"), to: .init(string: "B3")))
    XCTAssertTrue(board.move(from: .init(string: "H6"), to: .init(string: "H5")))
    XCTAssertEqual(board.display(), result)
  }

  func testInitialScore() {
    XCTAssertEqual(board.scores, [.black: 8, .white: 8])
  }

  func testMovePiecesAndScore() {
    XCTAssertTrue(board.move(from: .init(string: "A2"), to: .init(string: "A3")))
    XCTAssertTrue(board.move(from: .init(string: "A3"), to: .init(string: "A4")))
    XCTAssertTrue(board.move(from: .init(string: "A4"), to: .init(string: "A5")))
    XCTAssertTrue(board.move(from: .init(string: "A5"), to: .init(string: "A6")))
    XCTAssertTrue(board.move(from: .init(string: "A6"), to: .init(string: "A7")))
    XCTAssertEqual(board.scores, [.black: 8, .white: 7])

    XCTAssertTrue(board.move(from: .init(string: "A7"), to: .init(string: "B7")))
    XCTAssertEqual(board.scores, [.black: 8, .white: 6])

    XCTAssertTrue(board.move(from: .init(string: "C7"), to: .init(string: "B7")))
    XCTAssertEqual(board.scores, [.black: 7, .white: 6])
  }

  func testMoveWrongPositions() {
    XCTAssertFalse(board.move(from: .init(string: "A1"), to: .init(string: "A2")))
    XCTAssertFalse(board.move(from: .init(string: "B2"), to: .init(string: "C3")))
    XCTAssertFalse(board.move(from: .init(string: "A1"), to: .init(string: "C1")))
    XCTAssertFalse(board.move(from: .init(string: "H7"), to: .init(string: "I7")))
  }
}
