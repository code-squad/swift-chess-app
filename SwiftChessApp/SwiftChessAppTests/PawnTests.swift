//
//  PawnTests.swift
//  SwiftChessAppTests
//
//  Created by Freddy on 2022/09/27.
//

import XCTest
@testable import SwiftChessApp

final class PawnTests: XCTestCase {
  var blackPawn: Pawn!
  var whitePawn: Pawn!

  override func setUp() {
    super.setUp()

    blackPawn = Pawn(player: .black)
    whitePawn = Pawn(player: .white)
  }

  func testBlackPawnNextPositions() {
    let positions = blackPawn.availableNextPositions(from: .init(file: .B, rank: .R2)!, in: nil)

    XCTAssertEqual(positions, Set([.init(file: .A, rank: .R2)!, .init(file: .C, rank: .R2)!, .init(file: .B, rank: .R3)!]))
  }

  func testWhitePawnNextPositions() {
    let positions = whitePawn.availableNextPositions(from: .init(file: .G, rank: .R7)!, in: nil)

    XCTAssertTrue(positions.contains(Position(file: .G, rank: .R6)!))
    XCTAssertTrue(positions.contains(Position(file: .F, rank: .R7)!))
    XCTAssertTrue(positions.contains(Position(file: .H, rank: .R7)!))
    XCTAssertFalse(positions.contains(Position(file: .G, rank: .R8)!))
    XCTAssertFalse(positions.contains(Position(file: .E, rank: .R5)!))
  }
}
