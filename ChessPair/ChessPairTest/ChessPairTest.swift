//
//  ChessPairTest.swift
//  ChessPairTest
//
//  Created by 최동규 on 2022/10/06.
//

import XCTest

class ChessPairTest: XCTestCase {

  func testBlackKingInitialize() {
    let blackKing = BlackKing()

    let expectedPosition = Position(rank: .r1, file: .d)

    XCTAssertEqual(blackKing.initialPosition, expectedPosition)
  }

  func testWhiteKingInitialize() {
    let whiteKing = WhiteKing()

    let expectedPosition = Position(rank: .r8, file: .d)

    XCTAssertEqual(whiteKing.initialPosition, expectedPosition)
  }

  func testBlackKingPossablePositions() {
    let blackKing = BlackKing()

    let expectedPositions: Set<Position> = Set([Position(rank: Position.Rank.r2, file: Position.File.e),
                                                Position(rank: Position.Rank.r1, file: Position.File.e),
                                                Position(rank: Position.Rank.r1, file: Position.File.d),
                                                Position(rank: Position.Rank.r2, file: Position.File.c),
                                                Position(rank: Position.Rank.r2, file: Position.File.d),
                                                Position(rank: Position.Rank.r1, file: Position.File.c)])

    XCTAssertEqual(blackKing.possiblePositions(from: blackKing.initialPosition), expectedPositions)
  }

  func testKingCheckInstance() {
    let blackKing = BlackKing()
    let whiteKing = WhiteKing()

    XCTAssertFalse(blackKing.compare(other: whiteKing))
  }

  func testKingCheckSameInstance() {
    let blackKing = BlackKing()
    let anotherBlackKing = BlackKing()

    XCTAssertTrue(blackKing.compare(other: anotherBlackKing))
  }
}
